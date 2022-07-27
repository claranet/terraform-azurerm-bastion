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

  sku         = var.bastion_sku
  scale_units = var.bastion_scale_units

  ip_connect_enabled     = var.bastion_ip_connect_enabled
  shareable_link_enabled = var.bastion_shareable_link_enabled
  tunneling_enabled      = var.bastion_tunneling_enabled
  copy_paste_enabled     = var.bastion_copy_paste_enabled
  file_copy_enabled      = var.bastion_file_copy_enabled

  # Must be in the same rg as VNET
  resource_group_name = coalesce(var.network_resource_group_name, var.resource_group_name)

  ip_configuration {
    name                 = coalesce(var.custom_ipconfig_name, "bastionIPConfig")
    public_ip_address_id = azurerm_public_ip.bastion_pubip.id
    subnet_id            = module.subnet_bastion.subnet_id
  }

  tags = merge(local.default_tags, var.extra_tags)
}
