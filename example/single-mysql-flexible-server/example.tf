#--------------------------------------------*--------------------------------------------
# Single Example: Azure MySQL Flexible Server
#--------------------------------------------*--------------------------------------------


provider "azurerm" {
  features {}
}

# module call

module "resource_group" {
  source  = "cdornele/resource-group/azure"
  version = "1.0.0"
  stack     = "test"
  prefixes  = ["az","eus2"]
  suffixes  = ["t","01"]
  location  = "eastus2"
  tags      = {
    "environement" = "test"
    "owner"        = "example"
    "project"      =  "example"
    "customer"     = "example"
  }
}

module "mysql_flexible_server" {
  source  = "cdornele/mysql-flexible-server/azure"
  version = "1.0.1"
  mysql_flexible_server_stack = "test"
  mysql_flexible_server_prefixes = ["az","eus1"]
  mysql_flexible_server_suffixes = ["t","01"]
  resource_group_name = module.resource_group.name
  location = module.resource_group.location
  mysql_flexible_server_administrator = "sqladmin"
  mysql_flexible_server_administrator_password = "Password1234!"
  mysql_flexible_server_tier = "GeneralPurpose"
  mysql_flexible_server_backup_retention_days = 10
  mysql_flexible_server_geo_redundant_backup_enabled = true
  mysql_flexible_server_version = "8.0.21"
  mysql_flexible_server_size = "Standard_D2ds_v4"
  mysql_flexible_server_create_mode = "Default"
  mysql_flexible_server_zones = 1
  mysql_flexible_server_tags = {
    "environement" = "test"
    "owner"        = "example"
    "project"      =  "example"
    "customer"     = "example"
  }
  mysql_databases = {
    "test1" = {
      "charset"   = "utf8"
      "collation" = "utf8_general_ci"
    },
    "test2" = {
      "charset"   = "utf8"
      "collation" = "utf8_general_ci"
    }
  }
  mysql_flexible_server_firewall_allowed_cidrs = {
    "customer-office" = "1.1.1.1/32"
  }
}

# output

output "id" {
  value = module.mysql_flexible_server.id
}

output "name" {
  value = module.mysql_flexible_server.name
}

output "fqdn" {
  value = module.mysql_flexible_server.fqdn
}

output "public_network_access_enabled" {
  value = module.mysql_flexible_server.public_network_access_enabled
}



# end
#--------------------------------------------*--------------------------------------------