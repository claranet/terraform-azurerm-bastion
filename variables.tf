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
  description = "VNet and subnet Resource group name. To use only if you need to have a dedicated Resource Group for all Bastion resources (set via `resource_group_name` var)."
  type        = string
  default     = ""
}

variable "subnet_bastion_cidr" {
  description = "CIDR range for the dedicated Bastion subnet. Must be a range available in the VNet."
  type        = string
}

variable "public_ip_zones" {
  description = "Zones for public IP attached to the Bastion Host. Can be `null` if no zone distpatch."
  type        = list(number)
  default     = [1, 2, 3]
}

variable "default_outbound_access_enabled" {
  description = "Enable or Disable default_outbound_access. See [documentation](https://learn.microsoft.com/en-us/azure/virtual-network/ip-services/default-outbound-access)."
  type        = bool
  default     = false
}

# Bastion parameters
variable "sku" {
  description = "The SKU of the Bastion Host. Accepted values are `Basic` and `Standard`."
  type        = string
  default     = "Standard"
}

variable "scale_units" {
  description = "The number of scale units which to provision the Bastion Host. Possible values are between `2` and `50`."
  type        = number
  default     = 2
  validation {
    condition     = var.scale_units >= 2 && var.scale_units <= 50
    error_message = "The scale_units must be between 2 and 50."
  }
}

variable "ip_connect_enabled" {
  description = "Is IP Connect feature enabled for the Bastion Host."
  type        = bool
  default     = true
}

variable "shareable_link_enabled" {
  description = "Is Shareable Link feature enabled for the Bastion Host."
  type        = bool
  default     = false
}

variable "tunneling_enabled" {
  description = "Is Tunneling feature enabled for the Bastion Host."
  type        = bool
  default     = true
}

variable "copy_paste_enabled" {
  description = "Is Copy/Paste feature enabled for the Bastion Host."
  type        = bool
  default     = true
}

variable "file_copy_enabled" {
  description = "Is File Copy feature enabled for the Bastion Host."
  type        = bool
  default     = true
}
