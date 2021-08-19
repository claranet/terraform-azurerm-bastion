resource "azurerm_public_ip" "bastion_pubip" {
  name = coalesce(
    var.bastion_public_ip_custom_name,
    "${coalesce(var.custom_name, local.default_basename)}-pubip",
  )
  location            = var.location
  resource_group_name = var.resource_group_name

  sku               = "Standard" # Mandatory for Azure Bastion host
  allocation_method = "Static"

  tags = merge(local.default_tags, var.extra_tags)
}

resource "azurerm_bastion_host" "bastion" {
  name     = coalesce(var.custom_name, "${local.default_basename}-bastion")
  location = var.location

  # Must be in the same rg as VNET
  resource_group_name = coalesce(var.network_resource_group_name, var.resource_group_name)

  ip_configuration {
    name                 = coalesce(var.bastion_ipconfig_custom_name, "bastionIPConfig")
    public_ip_address_id = azurerm_public_ip.bastion_pubip.id
    subnet_id            = module.subnet_bastion.subnet_id
  }

  tags = merge(local.default_tags, var.extra_tags)
}
