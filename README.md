# Azure mySQL Flexible Server - Terraform Module
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurecaf"></a> [azurecaf](#requirement\_azurecaf) | 2.0.0-preview3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurecaf"></a> [azurecaf](#provider\_azurecaf) | 2.0.0-preview3 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_mysql_flexible_database.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_flexible_database) | resource |
| [azurerm_mysql_flexible_server.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_flexible_server) | resource |
| [azurerm_mysql_flexible_server_firewall_rule.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mysql_flexible_server_firewall_rule) | resource |
| [azurecaf_name.this](https://registry.terraform.io/providers/aztfmod/azurecaf/2.0.0-preview3/docs/data-sources/name) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | The location of the resources. | `string` | n/a | yes |
| <a name="input_mysql_databases"></a> [mysql\_databases](#input\_mysql\_databases) | The list of MySQL databases to create. | <pre>map(object({<br/>    charset   = optional(string, "utf8")<br/>    collation = optional(string, "utf8_general_ci")<br/>  }))</pre> | `{}` | no |
| <a name="input_mysql_flexible_server_administrator"></a> [mysql\_flexible\_server\_administrator](#input\_mysql\_flexible\_server\_administrator) | The administrator username of the MySQL Flexible Server. | `string` | n/a | yes |
| <a name="input_mysql_flexible_server_administrator_password"></a> [mysql\_flexible\_server\_administrator\_password](#input\_mysql\_flexible\_server\_administrator\_password) | The administrator password of the MySQL Flexible Server. | `any` | n/a | yes |
| <a name="input_mysql_flexible_server_backup_retention_days"></a> [mysql\_flexible\_server\_backup\_retention\_days](#input\_mysql\_flexible\_server\_backup\_retention\_days) | The backup retention days for the MySQL Flexible Server. | `number` | `14` | no |
| <a name="input_mysql_flexible_server_create_mode"></a> [mysql\_flexible\_server\_create\_mode](#input\_mysql\_flexible\_server\_create\_mode) | The mode to create MySQL Flexible Server. | `string` | `"Default"` | no |
| <a name="input_mysql_flexible_server_delegated_subnet_id"></a> [mysql\_flexible\_server\_delegated\_subnet\_id](#input\_mysql\_flexible\_server\_delegated\_subnet\_id) | The ID of the subnet in which the MySQL Flexible Server will be created. | `string` | `null` | no |
| <a name="input_mysql_flexible_server_firewall_allowed_cidrs"></a> [mysql\_flexible\_server\_firewall\_allowed\_cidrs](#input\_mysql\_flexible\_server\_firewall\_allowed\_cidrs) | The list of allowed CIDRs to access the MySQL Flexible Server. | `map(string)` | `{}` | no |
| <a name="input_mysql_flexible_server_geo_redundant_backup_enabled"></a> [mysql\_flexible\_server\_geo\_redundant\_backup\_enabled](#input\_mysql\_flexible\_server\_geo\_redundant\_backup\_enabled) | Enable Geo-redundant or not for server backup. Valid values for this property are Enabled or Disabled, not supported for the basic tier. | `bool` | `false` | no |
| <a name="input_mysql_flexible_server_high_availability"></a> [mysql\_flexible\_server\_high\_availability](#input\_mysql\_flexible\_server\_high\_availability) | The HA mode for the MySQL Flexible Server. | <pre>object({<br/>    mode      = optional(string, "SameZone" )<br/>    standby_availability_zone =  optional(number, 1)<br/>  })</pre> | `{}` | no |
| <a name="input_mysql_flexible_server_identity_ids"></a> [mysql\_flexible\_server\_identity\_ids](#input\_mysql\_flexible\_server\_identity\_ids) | The identity IDs | `list(string)` | `[]` | no |
| <a name="input_mysql_flexible_server_maintenance_window"></a> [mysql\_flexible\_server\_maintenance\_window](#input\_mysql\_flexible\_server\_maintenance\_window) | The maintenance window for the MySQL Flexible Server. | <pre>object({<br/>    day_of_week  = optional(number,0)<br/>    start_hour   = optional(number,0)<br/>    start_minute = optional(number,0)<br/>  })</pre> | `null` | no |
| <a name="input_mysql_flexible_server_point_in_time_restore_time_in_utc"></a> [mysql\_flexible\_server\_point\_in\_time\_restore\_time\_in\_utc](#input\_mysql\_flexible\_server\_point\_in\_time\_restore\_time\_in\_utc) | The restore point in time for the new server to be created. | `string` | `null` | no |
| <a name="input_mysql_flexible_server_prefixes"></a> [mysql\_flexible\_server\_prefixes](#input\_mysql\_flexible\_server\_prefixes) | The prefixes of the MySQL Flexible Server. | `list(string)` | `[]` | no |
| <a name="input_mysql_flexible_server_private_dns_zone_id"></a> [mysql\_flexible\_server\_private\_dns\_zone\_id](#input\_mysql\_flexible\_server\_private\_dns\_zone\_id) | The ID of the private DNS zone | `string` | `null` | no |
| <a name="input_mysql_flexible_server_size"></a> [mysql\_flexible\_server\_size](#input\_mysql\_flexible\_server\_size) | The size of the MySQL Flexible Server. | `string` | n/a | yes |
| <a name="input_mysql_flexible_server_source_server_id"></a> [mysql\_flexible\_server\_source\_server\_id](#input\_mysql\_flexible\_server\_source\_server\_id) | The source MySQL Flexible Server ID to be cloned to. | `string` | `null` | no |
| <a name="input_mysql_flexible_server_stack"></a> [mysql\_flexible\_server\_stack](#input\_mysql\_flexible\_server\_stack) | The stack of the MySQL Flexible Server. | `string` | n/a | yes |
| <a name="input_mysql_flexible_server_storage"></a> [mysql\_flexible\_server\_storage](#input\_mysql\_flexible\_server\_storage) | The storage for the MySQL Flexible Server. | <pre>object({<br/>    auto_grow_enabled  = optional(bool, true)<br/>    size_gb            = optional(number)<br/>    io_scaling_enabled = optional(bool, false)<br/>    iops               = optional(number)<br/>  })</pre> | `{}` | no |
| <a name="input_mysql_flexible_server_suffixes"></a> [mysql\_flexible\_server\_suffixes](#input\_mysql\_flexible\_server\_suffixes) | The suffixes of the MySQL Flexible Server. | `list(string)` | `[]` | no |
| <a name="input_mysql_flexible_server_tags"></a> [mysql\_flexible\_server\_tags](#input\_mysql\_flexible\_server\_tags) | The tags for the MySQL Flexible Server. | `map(string)` | `{}` | no |
| <a name="input_mysql_flexible_server_tier"></a> [mysql\_flexible\_server\_tier](#input\_mysql\_flexible\_server\_tier) | The tier of the MySQL Flexible Server. | `string` | n/a | yes |
| <a name="input_mysql_flexible_server_version"></a> [mysql\_flexible\_server\_version](#input\_mysql\_flexible\_server\_version) | The version of the MySQL Flexible Server. | `string` | n/a | yes |
| <a name="input_mysql_flexible_server_zones"></a> [mysql\_flexible\_server\_zones](#input\_mysql\_flexible\_server\_zones) | The zones for the MySQL Flexible Server. | `number` | `null` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group. | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_fqdn"></a> [fqdn](#output\_fqdn) | FQDN of the MySQL Flexible server. |
| <a name="output_id"></a> [id](#output\_id) | ID of the Azure MySQL Flexible server. |
| <a name="output_name"></a> [name](#output\_name) | Name of the Azure MySQL Flexible server. |
| <a name="output_public_network_access_enabled"></a> [public\_network\_access\_enabled](#output\_public\_network\_access\_enabled) | Is the public network access enabled? |
<!-- END_TF_DOCS -->