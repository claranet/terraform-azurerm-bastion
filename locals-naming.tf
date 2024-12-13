locals {
  # Naming locals/constants
  name_prefix = lower(var.name_prefix)
  name_suffix = lower(var.name_suffix)

  name           = coalesce(var.custom_name, data.azurecaf_name.bastion.result)
  public_ip_name = coalesce(var.custom_public_ip_name, data.azurecaf_name.bastion_pip.result)
  ip_config_name = coalesce(var.custom_ipconfig_name, "bastionIPConfig")
}
