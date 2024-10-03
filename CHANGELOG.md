## 7.1.0 (2024-10-03)

### Features

* use Claranet "azurecaf" provider dffa78d

### Miscellaneous Chores

* **deps:** update dependency trivy to v0.56.0 fcf178e

## 7.0.1 (2024-10-01)

### Documentation

* update README badge to use OpenTofu registry 7ef9839

### Miscellaneous Chores

* bump minimum AzureRM version d02388a
* **deps:** update dependency claranet/subnet/azurerm to v7.1.0 d626709
* **deps:** update dependency opentofu to v1.7.1 f96c646
* **deps:** update dependency opentofu to v1.7.2 972df9d
* **deps:** update dependency opentofu to v1.7.3 46224e6
* **deps:** update dependency opentofu to v1.8.0 28874fb
* **deps:** update dependency opentofu to v1.8.1 904c034
* **deps:** update dependency pre-commit to v3.7.1 fd6c11a
* **deps:** update dependency pre-commit to v3.8.0 8ff7eb5
* **deps:** update dependency terraform-docs to v0.18.0 93d6897
* **deps:** update dependency terraform-docs to v0.19.0 7ca02db
* **deps:** update dependency tflint to v0.51.1 c1762bd
* **deps:** update dependency tflint to v0.51.2 f60fef6
* **deps:** update dependency tflint to v0.52.0 25068d4
* **deps:** update dependency tflint to v0.53.0 82dd234
* **deps:** update dependency trivy to v0.51.1 70c80d2
* **deps:** update dependency trivy to v0.51.2 8424f28
* **deps:** update dependency trivy to v0.51.3 2662aae
* **deps:** update dependency trivy to v0.51.4 3b884c3
* **deps:** update dependency trivy to v0.52.0 f8131c8
* **deps:** update dependency trivy to v0.52.1 782ba92
* **deps:** update dependency trivy to v0.52.2 e376494
* **deps:** update dependency trivy to v0.53.0 5094511
* **deps:** update dependency trivy to v0.54.1 5c8bf97
* **deps:** update dependency trivy to v0.55.0 f9c60de
* **deps:** update dependency trivy to v0.55.1 5333005
* **deps:** update dependency trivy to v0.55.2 29c42e8
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.17.0 fc00f03
* **deps:** update pre-commit hook alessandrojcm/commitlint-pre-commit-hook to v9.18.0 25af5ea
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.0 72dcb69
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.1 585f1d6
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.2 a16f7c6
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.92.3 3c314e3
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.93.0 42d7a83
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.0 6f7a6b1
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.1 65ab95b
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.94.3 04173c0
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.95.0 b994bdd
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.96.0 90add02
* **deps:** update pre-commit hook antonbabenko/pre-commit-terraform to v1.96.1 0a3b638
* **deps:** update tools d37517a

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
