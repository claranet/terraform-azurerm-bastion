resource "azurerm_public_ip" "bastion_pubip" {
  name                = coalesce(var.custom_public_ip_name, azurecaf_name.bastion_pip.result)
  location            = var.location
  resource_group_name = var.resource_group_name

  sku               = "Standard" # Mandatory for Azure Bastion host
  allocation_method = "Static"

  tags = merge(local.default_tags, var.extra_tags)
}

resource "azurerm_bastion_host" "bastion" {
  name     = coalesce(var.custom_bastion_name, azurecaf_name.bastion.result)
  location = var.location

  # Must be in the same rg as VNET
  resource_group_name = coalesce(var.network_resource_group_name, var.resource_group_name)

  ip_configuration {
    name                 = coalesce(var.custom_ipconfig_name, "bastionIPConfig")
    public_ip_address_id = azurerm_public_ip.bastion_pubip.id
    subnet_id            = module.subnet_bastion.subnet_id
  }

  tags = merge(local.default_tags, var.extra_tags)
}
