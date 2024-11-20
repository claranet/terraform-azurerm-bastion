output "module_subnet" {
  description = "Module subnet bastion object outputs."
  value       = module.subnet_bastion
}

output "module_diagnostics" {
  description = "Diagnostics settings module outputs."
  value       = module.diagnostics
}

output "resource_public_ip" {
  description = "Azure Bastion public resource object."
  value       = azurerm_public_ip.main
}

output "resource" {
  description = "Azure Bastion resource object."
  value       = azurerm_bastion_host.main
}

output "id" {
  description = "Azure Bastion ID."
  value       = azurerm_bastion_host.main.id
}

output "name" {
  description = "Azure Bastion name."
  value       = azurerm_bastion_host.main.name
}

output "subnet_cidr" {
  description = "Dedicated subnet CIDR for the Bastion."
  value       = var.subnet_bastion_cidr
}

output "fqdn" {
  description = "Azure Bastion FQDN / generated DNS name."
  value       = azurerm_bastion_host.main.dns_name
}

output "subnet_id" {
  description = "Dedicated subnet id for the Bastion."
  value       = module.subnet_bastion.id
}

output "public_ip_name" {
  description = "Azure Bastion public IP resource name."
  value       = azurerm_public_ip.main.name
}

output "public_ip_address" {
  description = "Azure Bastion public IP address."
  value       = azurerm_public_ip.main.ip_address
}
