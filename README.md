# Azure Bastion
[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-yellow.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/claranet/bastion/azurerm/)

Azure terraform module to create an Azure Bastion (managed jump host) with optional dedicated subnet.

## Naming

Resource naming is based on the [Microsoft CAF naming convention best practices](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-naming). Legacy naming is available by setting the parameter `use_caf_naming` to false.
We rely on [the official Terraform Azure CAF naming provider](https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/resources/azurecaf_name) to generate resource names.

<!-- BEGIN_TF_DOCS -->
## Global versioning rule for Claranet Azure modules

| Module version | Terraform version | AzureRM version |
| -------------- | ----------------- | --------------- |
| >= 7.x.x       | 1.3.x             | >= 3.0          |
| >= 6.x.x       | 1.x               | >= 3.0          |
| >= 5.x.x       | 0.15.x            | >= 2.0          |
| >= 4.x.x       | 0.13.x / 0.14.x   | >= 2.0          |
| >= 3.x.x       | 0.12.x            | >= 2.0          |
| >= 2.x.x       | 0.12.x            | < 2.0           |
| <  2.x.x       | 0.11.x            | < 2.0           |

## Usage

This module is optimized to work with the [Claranet terraform-wrapper](https://github.com/claranet/terraform-wrapper) tool
which set some terraform variables in the environment needed by this module.
More details about variables set by the `terraform-wrapper` available in the [documentation](https://github.com/claranet/terraform-wrapper#environment).

```hcl
module "azure_region" {
  source  = "claranet/regions/azurerm"
  version = "x.x.x"

  azure_region = var.azure_region
}

module "rg" {
  source  = "claranet/rg/azurerm"
  version = "x.x.x"

  location    = module.azure_region.location
  client_name = var.client_name
  environment = var.environment
  stack       = var.stack
}

module "vnet" {
  source  = "claranet/vnet/azurerm"
  version = "x.x.x"

  environment    = var.environment
  location       = module.azure_region.location
  location_short = module.azure_region.location_short
  client_name    = var.client_name
  stack          = var.stack

  resource_group_name = module.rg.resource_group_name
  vnet_cidr           = ["10.10.1.0/16"]
}

module "bastion_host" {
  source  = "claranet/bastion/azurerm"
  version = "x.x.x"

  client_name         = var.client_name
  environment         = var.environment
  stack               = var.stack
  resource_group_name = module.rg.resource_group_name
  location            = module.azure_region.location
  location_short      = module.azure_region.location_short

  subnet_bastion_cidr = "10.10.1.0/27"

  virtual_network_name = module.vnet.virtual_network_name
}
```

## Providers

| Name | Version |
|------|---------|
| azurecaf | ~> 1.1 |
| azurerm | >= 2.93 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| subnet\_bastion | claranet/subnet/azurerm | 5.0.0 |

## Resources

| Name | Type |
|------|------|
| [azurecaf_name.bastion](https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/resources/name) | resource |
| [azurecaf_name.bastion_pip](https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/resources/name) | resource |
| [azurerm_bastion_host.bastion](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/bastion_host) | resource |
| [azurerm_public_ip.bastion_pubip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| client\_name | Client name/account used in naming | `string` | n/a | yes |
| copy\_paste\_enabled | Is Copy/Paste feature enabled for the Bastion Host. | `bool` | `true` | no |
| custom\_bastion\_name | Custom Bastion name, generated if not set | `string` | `""` | no |
| custom\_ipconfig\_name | Bastion IP Config custom name | `string` | `""` | no |
| custom\_public\_ip\_name | Bastion IP Config resource custom name | `string` | `""` | no |
| default\_tags\_enabled | Option to enable or disable default tags | `bool` | `true` | no |
| environment | Project environment | `string` | n/a | yes |
| extra\_tags | Additional tags to associate with resources | `map(string)` | `{}` | no |
| file\_copy\_enabled | Is File Copy feature enabled for the Bastion Host. | `bool` | `true` | no |
| ip\_connect\_enabled | Is IP Connect feature enabled for the Bastion Host. | `bool` | `true` | no |
| location | Azure region to use | `string` | n/a | yes |
| location\_short | Short string for Azure location | `string` | n/a | yes |
| name\_prefix | Optional prefix for the generated name | `string` | `""` | no |
| name\_suffix | Optional suffix for the generated name | `string` | `""` | no |
| network\_resource\_group\_name | Vnet and subnet Resource group name. To use only if you need to have a dedicated Resource Group for all Bastion resources. (set via `resource_group_name` var.) | `string` | `""` | no |
| resource\_group\_name | Name of the resource group | `string` | n/a | yes |
| scale\_units | The number of scale units which to provision the Bastion Host. Possible values are between `2` and `50` | `number` | `2` | no |
| shareable\_link\_enabled | Is Shareable Link feature enabled for the Bastion Host. | `bool` | `false` | no |
| sku | The SKU of the Bastion Host. Accepted values are `Basic` and `Standard` | `string` | `"Standard"` | no |
| stack | Project stack name | `string` | n/a | yes |
| subnet\_bastion\_cidr | CIDR range for the dedicated Bastion subnet. Must be a range available in the Vnet. | `string` | n/a | yes |
| tunneling\_enabled | Is Tunneling feature enabled for the Bastion Host. | `bool` | `true` | no |
| use\_caf\_naming | Use the Azure CAF naming provider to generate default resource name. `custom_rg_name` override this if set. Legacy default name is used if this is set to `false`. | `bool` | `true` | no |
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

Azure Bastion documentation: [docs.microsoft.com/en-us/azure/bastion/](https://docs.microsoft.com/en-us/azure/bastion/)
