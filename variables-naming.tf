variable "name_prefix" {
  description = "Optional prefix for the generated name."
  type        = string
  default     = ""
}

variable "name_suffix" {
  description = "Optional suffix for the generated name."
  type        = string
  default     = ""
}

# Bastion naming

variable "custom_name" {
  description = "Custom Bastion name, generated if not set."
  type        = string
  default     = ""
}

variable "custom_public_ip_name" {
  description = "Bastion IP Config resource custom name."
  type        = string
  default     = ""
}

variable "custom_ipconfig_name" {
  description = "Bastion IP Config custom name."
  type        = string
  default     = ""
}
