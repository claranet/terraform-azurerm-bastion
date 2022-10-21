# v6.1.0 - 2022-10-21

Added
  * AZ-879: Add `public_ip_zones` parameter
  * AZ-846: Add diagnostics settings module

Changed
  * AZ-844: Bump `subnet` module to latest version
  * AZ-879: Disable `ip_connect_enabled`, `shareable_link_enabled`, `tunneling_enabled` and `file_copy_enabled` parameters when the Azure Bastion SKU is `Basic`

# v6.0.0 - 2022-08-05

Added
  * AZ-804: Add multiple options added since `azurerm` `v2.93`
  * AZ-804: Bump subnet module to `v5.0.0`

# v5.1.0 - 2022-04-15

Added
  * AZ-615: Add an option to enable or disable default tags

# v4.0.0/v5.0.0 - 2021-10-15

Changed
  * AZ-572: Revamp examples and improve CI

Added
  * AZ-517: Azure Bastion host module - First Release

Updated
  * AZ-532: Revamp README with latest `terraform-docs` tool
  * AZ-530: Cleanup module and fix linter errors
  * AZ-515: Option to use Azure CAF naming provider to name resources
