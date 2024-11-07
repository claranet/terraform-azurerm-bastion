module "subnet_bastion" {
  # source  = "claranet/subnet/azurerm"
  # version = "~> 8.0.0"
  source = "git::ssh://git@git.fr.clara.net/claranet/projects/cloud/azure/terraform/modules/subnet.git?ref=refactor/AZ-1088-rework-module"

  environment    = var.environment
  location_short = var.location_short
  client_name    = var.client_name
  stack          = var.stack

  resource_group_name  = coalesce(var.network_resource_group_name, var.resource_group_name)
  virtual_network_name = var.virtual_network_name

  cidrs = [var.subnet_bastion_cidr]

  # Fixed name, imposed by Azure
  custom_name = "AzureBastionSubnet"

  # No NSG because the Bastion needs to generate its own rules
  network_security_group_name = null

  # No RTB because the Bastion needs to generate its own routes and propagate them
  route_table_name = null

  default_outbound_access_enabled = var.default_outbound_access_enabled
}
