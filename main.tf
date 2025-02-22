#--------------------------------------------*--------------------------------------------
# Module: Azure Database MySQL Flexible - Main
#--------------------------------------------*--------------------------------------------

data "azurecaf_name" "this" {
  name          = var.mysql_flexible_server_stack
  resource_type = "azurerm_mysql_flexible_server"
  prefixes      = var.mysql_flexible_server_prefixes
  suffixes      = var.mysql_flexible_server_suffixes
  use_slug      = true
  clean_input   = true
  separator     = "-"
}

resource "azurerm_mysql_flexible_server" "this" {

  name  = data.azurecaf_name.this.result

  location = var.location
  resource_group_name = var.resource_group_name

  administrator_login = var.mysql_flexible_server_administrator
  administrator_password = var.mysql_flexible_server_administrator_password

  sku_name =  join("_", [lookup(local.mysql_flexible_server_tier_map, var.mysql_flexible_server_tier, "GeneralPurpose"), var.mysql_flexible_server_size])
  version = var.mysql_flexible_server_version

  delegated_subnet_id = var.mysql_flexible_server_delegated_subnet_id
  private_dns_zone_id = var.mysql_flexible_server_private_dns_zone_id

  backup_retention_days = var.mysql_flexible_server_backup_retention_days
  geo_redundant_backup_enabled = var.mysql_flexible_server_geo_redundant_backup_enabled

  create_mode = var.mysql_flexible_server_create_mode
  source_server_id = var.mysql_flexible_server_source_server_id
  point_in_time_restore_time_in_utc = var.mysql_flexible_server_point_in_time_restore_time_in_utc

  dynamic "high_availability" {
    for_each = var.mysql_flexible_server_high_availability[*]
    content {
      mode                      = high_availability.value.mode
      standby_availability_zone = high_availability.value.standby_availability_zone
    }
  }

  dynamic "maintenance_window" {
    for_each = var.mysql_flexible_server_maintenance_window[*]
    content {
      day_of_week  = maintenance_window.value.day_of_week
      start_hour   = maintenance_window.value.start_hour
      start_minute = maintenance_window.value.start_minute
    }
  }

  dynamic "storage" {
    for_each = var.mysql_flexible_server_storage[*]
    content {
      auto_grow_enabled  = storage.value.auto_grow_enabled
      size_gb            = storage.value.size_gb
      io_scaling_enabled = storage.value.io_scaling_enabled
      iops               = storage.value.iops
    }
  }

  dynamic "identity" {
    for_each = length(var.mysql_flexible_server_identity_ids) > 0 ? [1] : []
    content {
      type         = "UserAssigned"
      identity_ids = var.mysql_flexible_server_identity_ids
    }
  }

  zone = var.mysql_flexible_server_zones

  tags = var.mysql_flexible_server_tags

  lifecycle {
    ignore_changes = [
      zone,
      high_availability[0].standby_availability_zone,
    ]
    precondition {
      condition     = (var.mysql_flexible_server_storage.io_scaling_enabled && var.mysql_flexible_server_storage.iops != null) || (!var.mysql_flexible_server_storage.io_scaling_enabled && var.mysql_flexible_server_storage.iops == null)
      error_message = "You have to choose between enabling storage auto-scaling IO without defining storage IOPS or disabling storage auto-scaling IO with defined storage IOPS."
    }
  }
}

resource "azurerm_mysql_flexible_database" "this" {
  for_each = var.mysql_databases

  name                = each.key
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.this.name
  charset             = each.value.charset
  collation           = each.value.collation
}

resource "azurerm_mysql_flexible_server_firewall_rule" "this" {
  for_each = var.mysql_flexible_server_delegated_subnet_id == null ? var.mysql_flexible_server_firewall_allowed_cidrs : {}

  name                = each.key
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.this.name
  start_ip_address    = cidrhost(each.value, 0)
  end_ip_address      = cidrhost(each.value, -1)
}


# end
#--------------------------------------------*--------------------------------------------