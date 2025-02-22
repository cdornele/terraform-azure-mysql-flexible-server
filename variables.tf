#--------------------------------------------*--------------------------------------------
# Module: Azure Database MySQL Flexible - Variables
#--------------------------------------------*--------------------------------------------

variable "location" {
  description = "The location of the resources."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
}

variable "mysql_flexible_server_prefixes" {
  description = "The prefixes of the MySQL Flexible Server."
  type        = list(string)
  default     = []
}

variable "mysql_flexible_server_suffixes" {
  description = "The suffixes of the MySQL Flexible Server."
  type        = list(string)
  default     = []
}

variable "mysql_flexible_server_stack" {
  description = "The stack of the MySQL Flexible Server."
  type        = string
}

variable "mysql_flexible_server_administrator" {
  description = "The administrator username of the MySQL Flexible Server."
  type        = string
}

variable "mysql_flexible_server_administrator_password" {
  description = "The administrator password of the MySQL Flexible Server."
}

variable "mysql_flexible_server_tier" {
  description = "The tier of the MySQL Flexible Server."
  type        = string
}

variable "mysql_flexible_server_size" {
  description = "The size of the MySQL Flexible Server."
  type        = string
}

variable "mysql_flexible_server_version" {
  description = "The version of the MySQL Flexible Server."
  type        = string
}

variable "mysql_flexible_server_delegated_subnet_id" {
  description = "The ID of the subnet in which the MySQL Flexible Server will be created."
  type        = string
  default     = null
}

variable "mysql_flexible_server_private_dns_zone_id" {
  description = "The ID of the private DNS zone"
  type        = string
  default     = null
}

variable "mysql_flexible_server_backup_retention_days" {
  description = "The backup retention days for the MySQL Flexible Server."
  type        = number
  default     = 14
}

variable "mysql_flexible_server_geo_redundant_backup_enabled" {
  description = "Enable Geo-redundant or not for server backup. Valid values for this property are Enabled or Disabled, not supported for the basic tier."
  type        = bool
  default     = false
}

variable "mysql_flexible_server_create_mode" {
  description = "The mode to create MySQL Flexible Server."
  type        = string
  default     = "Default"
}

variable "mysql_flexible_server_source_server_id" {
  description = "The source MySQL Flexible Server ID to be cloned to."
  type        = string
  default     = null
}

variable "mysql_flexible_server_point_in_time_restore_time_in_utc" {
  description = "The restore point in time for the new server to be created."
  type        = string
  default     = null
}

variable "mysql_flexible_server_high_availability" {
  description = "The HA mode for the MySQL Flexible Server."
  type        = object({
    mode      = optional(string, "SameZone" )
    standby_availability_zone =  optional(number, 1)
  })
  default     = {}
}

variable "mysql_flexible_server_maintenance_window" {
  description = "The maintenance window for the MySQL Flexible Server."
  type        = object({
    day_of_week  = optional(number,0)
    start_hour   = optional(number,0)
    start_minute = optional(number,0)
  })
  default     = null
}

variable "mysql_flexible_server_storage" {
  description = "The storage for the MySQL Flexible Server."
  type        = object({
    auto_grow_enabled  = optional(bool, true)
    size_gb            = optional(number)
    io_scaling_enabled = optional(bool, false)
    iops               = optional(number)
  })
  default     = {}
}

variable "mysql_flexible_server_identity_ids" {
  description = "The identity IDs"
  type        = list(string)
  default     = []
}

variable "mysql_flexible_server_zones" {
  description = "The zones for the MySQL Flexible Server."
  type        = number
  default     = null
}

variable "mysql_flexible_server_tags" {
  description = "The tags for the MySQL Flexible Server."
  type        = map(string)
  default     = {}
}

# end
#--------------------------------------------*--------------------------------------------