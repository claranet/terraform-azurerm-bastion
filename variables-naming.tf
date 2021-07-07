variable "name_prefix" {
  description = "Optional prefix for the generated name"
  type        = string
  default     = ""
}

variable "name_suffix" {
  description = "Optional suffix for the generated name"
  type        = string
  default     = ""
}

variable "use_caf_naming" {
  description = "Use the Azure CAF naming provider to generate default resource name. `custom_rg_name` override this if set. Legacy default name is used if this is set to `false`."
  type        = bool
  default     = true
}

# Bastion naming

variable "bastion_custom_name" {
  description = "Custom Bastion name, generated if not set"
  default     = ""
}

variable "bastion_public_ip_custom_name" {
  description = "Bastion IP Config resource custom name"
  type        = string
  default     = ""
}

variable "bastion_ipconfig_custom_name" {
  description = "Bastion IP Config custom name"
  type        = string
  default     = ""
}
