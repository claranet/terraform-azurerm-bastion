# Global variables
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region to use"
  type        = string
}

variable "location_short" {
  description = "Short string for Azure location"
  type        = string
}

variable "environment" {
  description = "Project environment"
  type        = string
}

variable "stack" {
  description = "Project stack name"
  type        = string
}

variable "client_name" {
  description = "Client name/account used in naming"
  type        = string
}

# Bastion network parameters
variable "virtual_network_name" {
  description = "Virtual Network Name where the dedicated Subnet and Bastion will be created."
  type        = string
}

variable "network_resource_group_name" {
  description = "Vnet and subnet Resource group name. To use only if you need to have a dedicated Resource Group for all Bastion resources. (set via `resource_group_name` var.)"
  type        = string
  default     = ""
}

variable "subnet_bastion_cidr" {
  description = "CIDR range for the dedicated Bastion subnet. Must be a range available in the Vnet."
  type        = string
}

variable "bastion_sku" {
  description = "The SKU of the Bastion Host. Accepted values are `Basic` and `Standard`"
  type        = string
  default     = "Basic"
}

variable "bastion_scale_units" {
  description = "The number of scale units which to provision the Bastion Host. Possible values are between `2` and `50`"
  type        = number
  default     = 2
  validation {
    condition     = var.bastion_scale_units >= 2 && var.bastion_scale_units <= 50
    error_message = "The bastion_scale_units must be between 2 and 50."
  }
}

variable "bastion_ip_connect_enabled" {
  description = "Is IP Connect feature enabled for the Bastion Host."
  type        = bool
  default     = false
}

variable "bastion_shareable_link_enabled" {
  description = "Is Shareable Link feature enabled for the Bastion Host."
  type        = bool
  default     = false
}

variable "bastion_tunneling_enabled" {
  description = "Is Tunneling feature enabled for the Bastin Host."
  type        = bool
  default     = false
}

variable "bastion_copy_paste_enabled" {
  description = "Is Copy/Paste feature enabled for the Bastion Host."
  type        = bool
  default     = true
}

variable "bastion_file_copy_enabled" {
  description = "Is File Copy feature enabled for the Bastion Host."
  type        = bool
  default     = false
}
