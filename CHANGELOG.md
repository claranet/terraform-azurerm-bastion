## 7.0.0 (2024-05-03)


### ⚠ BREAKING CHANGES

* minimal version of Terraform is now `v1.3`

### build

* bump tf minimum version 15dbff6


### Continuous Integration

* **AZ-1391:** enable semantic-release [skip ci] b4d149e
* **AZ-1391:** update semantic-release config [skip ci] 03ae3f0


### Miscellaneous Chores

* **deps:** enable automerge on renovate 100ef55
* **deps:** update dependency claranet/subnet/azurerm to v7 5e19bca
* **deps:** update dependency opentofu to v1.7.0 4398079
* **deps:** update dependency tflint to v0.51.0 45553c3
* **deps:** update dependency trivy to v0.50.2 8970dd8
* **deps:** update dependency trivy to v0.50.4 2906578
* **deps:** update dependency trivy to v0.51.0 f1b42f2
* **pre-commit:** update commitlint hook 72a2d59
* **release:** remove legacy `VERSION` file 351e762

# v6.4.0 - 2024-03-22

Added
  * AZ-1367: Added `bastion_subnet_cidr` to outputs

# v6.3.1 - 2024-03-01

Fixed
  * AZ-1367: Changed `subnet_bastion` file name to `r-subnet.tf`

# v6.3.0 - 2024-02-29

Changed
  * AZ-1366: Bump `logs` module to latest version and remove `logs_retention_days` variable

# v6.2.2 - 2023-04-04

Fixed
  * AZ-1049: Fix public IP resource name

# v6.2.1 - 2022-11-25

Changed
  * AZ-908: Bump `subnet` module with latest CAF naming using data

# v6.2.0 - 2022-11-23

Changed
  * AZ-908: Use the new data source for CAF naming (instead of resource)

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
