#--------------------------------------------*--------------------------------------------
# Module: Azure Database MySQL Flexible - Outputs
#--------------------------------------------*--------------------------------------------

output "id" {
  description = "ID of the Azure MySQL Flexible server."
  value       = azurerm_mysql_flexible_server.this.id
}

output "name" {
  description = "Name of the Azure MySQL Flexible server."
  value       = azurerm_mysql_flexible_server.this.name
}

output "fqdn" {
  description = "FQDN of the MySQL Flexible server."
  value       = azurerm_mysql_flexible_server.this.fqdn
}

output "public_network_access_enabled" {
  description = "Is the public network access enabled?"
  value       = azurerm_mysql_flexible_server.this.public_network_access_enabled
}

# end
#--------------------------------------------*--------------------------------------------
