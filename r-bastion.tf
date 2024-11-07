resource "azurerm_public_ip" "main" {
  name                = local.public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku               = "Standard" # Mandatory for Azure Bastion host
  allocation_method = "Static"

  zones = var.public_ip_zones

  tags = merge(local.default_tags, var.extra_tags)
}

moved {
  from = azurerm_public_ip.bastion_pubip
  to   = azurerm_public_ip.main
}

resource "azurerm_bastion_host" "main" {
  name     = local.name
  location = var.location

  sku         = var.sku
  scale_units = var.scale_units

  ip_connect_enabled     = var.sku != "Basic" && var.ip_connect_enabled
  shareable_link_enabled = var.sku != "Basic" && var.shareable_link_enabled
  tunneling_enabled      = var.sku != "Basic" && var.tunneling_enabled
  file_copy_enabled      = var.sku != "Basic" && var.file_copy_enabled
  copy_paste_enabled     = var.copy_paste_enabled

  # Must be in the same RG as VNet
  resource_group_name = coalesce(var.network_resource_group_name, var.resource_group_name)

  ip_configuration {
    name                 = local.ip_config_name
    public_ip_address_id = azurerm_public_ip.main.id
    subnet_id            = module.subnet_bastion.id
  }

  tags = merge(local.default_tags, var.extra_tags)
}

moved {
  from = azurerm_bastion_host.bastion
  to   = azurerm_bastion_host.main
}
