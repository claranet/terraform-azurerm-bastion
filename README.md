# Azure Bastion
[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md) [![Notice](https://img.shields.io/badge/notice-copyright-blue.svg)](NOTICE) [![Apache V2 License](https://img.shields.io/badge/license-Apache%20V2-orange.svg)](LICENSE) [![OpenTofu Registry](https://img.shields.io/badge/opentofu-registry-yellow.svg)](https://search.opentofu.org/module/claranet/bastion/azurerm/)

Azure terraform module to create an Azure Bastion (managed jump host) with optional dedicated subnet.

## Naming

Resource naming is based on the [Microsoft CAF naming convention best practices](https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-naming). Legacy naming is available by setting the parameter `use_caf_naming` to false.
We rely on [the official Terraform Azure CAF naming provider](https://registry.terraform.io/providers/aztfmod/azurecaf/latest/docs/resources/azurecaf_name) to generate resource names.

<!-- BEGIN_TF_DOCS -->
## Global versioning rule for Claranet Azure modules

| Module version | Terraform version | OpenTofu version | AzureRM version |
| -------------- | ----------------- | ---------------- | --------------- |
| >= 8.x.x       | **Unverified**    | 1.8.x            | >= 4.0          |
| >= 7.x.x       | 1.3.x             |                  | >= 3.0          |
| >= 6.x.x       | 1.x               |                  | >= 3.0          |
| >= 5.x.x       | 0.15.x            |                  | >= 2.0          |
| >= 4.x.x       | 0.13.x / 0.14.x   |                  | >= 2.0          |
| >= 3.x.x       | 0.12.x            |                  | >= 2.0          |
| >= 2.x.x       | 0.12.x            |                  | < 2.0           |
| <  2.x.x       | 0.11.x            |                  | < 2.0           |

## Contributing

If you want to contribute to this repository, feel free to use our [pre-commit](https://pre-commit.com/) git hook configuration
which will help you automatically update and format some files for you by enforcing our Terraform code module best-practices.

More details are available in the [CONTRIBUTING.md](./CONTRIBUTING.md#pull-request-process) file.

## Usage

This module is optimized to work with the [Claranet terraform-wrapper](https://github.com/claranet/terraform-wrapper) tool
which set some terraform variables in the environment needed by this module.
More details about variables set by the `terraform-wrapper` available in the [documentation](https://github.com/claranet/terraform-wrapper#environment).

⚠️ Since modules version v8.0.0, we do not maintain/check anymore the compatibility with
[Hashicorp Terraform](https://github.com/hashicorp/terraform/). Instead, we recommend to use [OpenTofu](https://github.com/opentofu/opentofu/).

```hcl
module "vnet" {
  source  = "claranet/vnet/azurerm"
  version = "x.x.x"

  location       = module.azure_region.location
  location_short = module.azure_region.location_short
  client_name    = var.client_name
  environment    = var.environment
  stack          = var.stack

  resource_group_name = module.rg.name

  cidrs = ["10.10.1.0/16"]
}

module "bastion_host" {
  source  = "claranet/bastion/azurerm"
  version = "x.x.x"

  location       = module.azure_region.location
  location_short = module.azure_region.location_short
  client_name    = var.client_name
  environment    = var.environment
  stack          = var.stack

  resource_group_name = module.rg.name

  subnet_bastion_cidr = "10.10.1.0/27"

  virtual_network_name = module.vnet.name

  logs_destinations_ids = [
    module.run.logs_storage_account_id,
    module.run.log_analytics_workspace_id,
  ]

  extra_tags = {
    foo = "bar"
  }
}
```

## Providers

| Name | Version |
|------|---------|
| azurecaf | ~> 1.2.28 |
| azurerm | ~> 4.31 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| diagnostics | claranet/diagnostic-settings/azurerm | ~> 8.2.0 |
| subnet\_bastion | claranet/subnet/azurerm | ~> 8.1.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_bastion_host.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/bastion_host) | resource |
| [azurerm_public_ip.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurecaf_name.bastion](https://registry.terraform.io/providers/claranet/azurecaf/latest/docs/data-sources/name) | data source |
| [azurecaf_name.bastion_pip](https://registry.terraform.io/providers/claranet/azurecaf/latest/docs/data-sources/name) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| client\_name | Client name/account used in naming. | `string` | n/a | yes |
| copy\_paste\_enabled | Is Copy/Paste feature enabled for the Bastion Host. | `bool` | `true` | no |
| custom\_ipconfig\_name | Bastion IP Config custom name. | `string` | `""` | no |
| custom\_name | Custom Bastion name, generated if not set. | `string` | `""` | no |
| custom\_public\_ip\_name | Bastion IP Config resource custom name. | `string` | `""` | no |
| default\_outbound\_access\_enabled | Enable or Disable default\_outbound\_access. See [documentation](https://learn.microsoft.com/en-us/azure/virtual-network/ip-services/default-outbound-access). | `bool` | `false` | no |
| default\_tags\_enabled | Option to enable or disable default tags. | `bool` | `true` | no |
| diagnostic\_settings\_custom\_name | Custom name of the diagnostics settings, name will be `default` if not set. | `string` | `"default"` | no |
| environment | Project environment. | `string` | n/a | yes |
| extra\_tags | Additional tags to associate with resources. | `map(string)` | `{}` | no |
| file\_copy\_enabled | Is File Copy feature enabled for the Bastion Host. | `bool` | `true` | no |
| ip\_connect\_enabled | Is IP Connect feature enabled for the Bastion Host. | `bool` | `true` | no |
| location | Azure region to use. | `string` | n/a | yes |
| location\_short | Short string for Azure location. | `string` | n/a | yes |
| logs\_categories | Log categories to send to destinations. | `list(string)` | `null` | no |
| logs\_destinations\_ids | List of destination resources IDs for logs diagnostic destination.<br/>Can be `Storage Account`, `Log Analytics Workspace` and `Event Hub`. No more than one of each can be set.<br/>If you want to use Azure EventHub as a destination, you must provide a formatted string containing both the EventHub Namespace authorization send ID and the EventHub name (name of the queue to use in the Namespace) separated by the <code>&#124;</code> character. | `list(string)` | n/a | yes |
| logs\_metrics\_categories | Metrics categories to send to destinations. | `list(string)` | `null` | no |
| name\_prefix | Optional prefix for the generated name. | `string` | `""` | no |
| name\_suffix | Optional suffix for the generated name. | `string` | `""` | no |
| network\_resource\_group\_name | VNet and subnet Resource group name. To use only if you need to have a dedicated Resource Group for all Bastion resources (set via `resource_group_name` var). | `string` | `""` | no |
| public\_ip\_zones | Zones for public IP attached to the Bastion Host. Can be `null` if no zone distpatch. | `list(number)` | <pre>[<br/>  1,<br/>  2,<br/>  3<br/>]</pre> | no |
| resource\_group\_name | Name of the resource group. | `string` | n/a | yes |
| scale\_units | The number of scale units which to provision the Bastion Host. Possible values are between `2` and `50`. | `number` | `2` | no |
| shareable\_link\_enabled | Is Shareable Link feature enabled for the Bastion Host. | `bool` | `false` | no |
| sku | The SKU of the Bastion Host. Accepted values are `Basic` and `Standard`. | `string` | `"Standard"` | no |
| stack | Project stack name. | `string` | n/a | yes |
| subnet\_bastion\_cidr | CIDR range for the dedicated Bastion subnet. Must be a range available in the VNet. | `string` | n/a | yes |
| tunneling\_enabled | Is Tunneling feature enabled for the Bastion Host. | `bool` | `true` | no |
| virtual\_network\_name | Virtual Network Name where the dedicated Subnet and Bastion will be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| fqdn | Azure Bastion FQDN / generated DNS name. |
| id | Azure Bastion ID. |
| module\_diagnostics | Diagnostics settings module outputs. |
| module\_subnet | Module subnet bastion object outputs. |
| name | Azure Bastion name. |
| public\_ip\_address | Azure Bastion public IP address. |
| public\_ip\_name | Azure Bastion public IP resource name. |
| resource | Azure Bastion resource object. |
| resource\_public\_ip | Azure Bastion public resource object. |
| subnet\_cidr | Dedicated subnet CIDR for the Bastion. |
| subnet\_id | Dedicated subnet id for the Bastion. |
<!-- END_TF_DOCS -->

## Related documentation

Azure Bastion documentation: [docs.microsoft.com/en-us/azure/bastion/](https://docs.microsoft.com/en-us/azure/bastion/)
