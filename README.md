# Azure Bastion
[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/claranet/bastion/azurerm/)

Azure terraform module to create an Azure Bastion (managed jump host) with optional dedicated subnet.

## Version compatibility

| Module version | Terraform version | AzureRM version |
| -------------- | ----------------- | --------------- |
| >= 5.x.x       | 1.0.x             | >= 2.0          |
| >= 4.x.x       | 0.13.x            | >= 2.0          |
| >= 3.x.x       | 0.12.x            | >= 2.0          |
| >= 2.x.x       | 0.12.x            | < 2.0           |
| <  2.x.x       | 0.11.x            | < 2.0           |

## Usage

This module is optimized to work with the [Claranet terraform-wrapper](https://github.com/claranet/terraform-wrapper) tool
which set some terraform variables in the environment needed by this module.
More details about variables set by the `terraform-wrapper` available in the [documentation](https://github.com/claranet/terraform-wrapper#environment).

```hcl
module "azure-region" {
  source  = "claranet/regions/azurerm"
  version = "x.x.x"

  azure_region = var.azure_region
}

module "rg" {
  source  = "claranet/rg/azurerm"
  version = "x.x.x"

  location    = module.azure-region.location
  client_name = var.client_name
  environment = var.environment
  stack       = var.stack
}

module "network-vnet" {
  source  = "claranet/vnet/azurerm"
  version = "x.x.x"

  environment      = var.environment
  location         = module.azure-region.location
  location_short   = module.azure-region.location-short
  client_name      = var.client_name
  stack            = var.stack
  custom_vnet_name = var.custom_vnet_name

  resource_group_name = module.rg.resource_group_name
  vnet_cidr           = ["10.10.1.0/16"]
}

module "bastion-host" {
  source  = "claranet/bastion/azurerm"
  version = "x.x.x"

  client_name         = var.client_name
  environment         = var.environment
  stack               = var.stack
  resource_group_name = module.rg.resource_group_name
  location            = module.azure-region.location
  location_short      = module.azure-region.location_short

  subnet_bastion_cidr = local.subnets["bastion"].cidr

  virtual_network_name = module.network-vnet.virtual_network_name
}
```

<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| azurerm | >= 2.8 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| azure-network-subnet-bastion | claranet/subnet/azurerm | 4.2.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_bastion_host.bastion](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/bastion_host) | resource |
| [azurerm_public_ip.bastion_pubip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bastion\_ipconfig\_custom\_name | Bastion IP Config custom name | `string` | `""` | no |
| bastion\_public\_ip\_custom\_name | Bastion IP Config resource custom name | `string` | `""` | no |
| client\_name | Client name/account used in naming | `string` | n/a | yes |
| custom\_name | Custom Bastion name, generated if not set | `string` | `""` | no |
| environment | Project environment | `string` | n/a | yes |
| extra\_tags | Additional tags to associate with resources. | `map(string)` | `{}` | no |
| location | Azure region to use | `string` | n/a | yes |
| location\_short | Short string for Azure location | `string` | n/a | yes |
| name\_prefix | Optional prefix for Bastion name | `string` | `""` | no |
| network\_resource\_group\_name | Vnet and subnet Resource group name. To use only if you need to have a dedicated Resource Group for all Bastion resources. (set via `resource_group_name` var.) | `string` | `""` | no |
| resource\_group\_name | Name of the resource group | `string` | n/a | yes |
| stack | Project stack name | `string` | n/a | yes |
| subnet\_bastion\_cidr | CIDR range for the dedicated Bastion subnet. Must be a range available in the Vnet. | `string` | n/a | yes |
| virtual\_network\_name | Virtual Network Name where the dedicated Subnet and Bastion will be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| bastion\_fqdn | Azure Bastion FQDN / generated DNS name. |
| bastion\_id | Azure Bastion id. |
| bastion\_name | Azure Bastion name. |
| bastion\_public\_ip | Azure Bastion public IP. |
| bastion\_public\_ip\_name | Azure Bastion public IP resource name. |
| bastion\_subnet\_id | Dedicated subnet id for the Bastion. |
<!-- END_TF_DOCS -->
## Related documentation

Terraform Azure Bastion documentation: [terraform.io/providers/hashicorp/azurerm/latest/docs/resources/bastion_host](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/bastion_host)
