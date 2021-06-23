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

variable "name_prefix" {
  description = "Optional prefix for Bastion name"
  type        = string
  default     = ""
}

variable "custom_name" {
  description = "Custom Bastion name, generated if not set"
  default     = ""
}

variable "extra_tags" {
  description = "Additional tags to associate with resources."
  type        = map(string)
  default     = {}
}

# Bastion network parameters

variable "bastion_public_ip_custom_name" {
  description = "Bastion IP Config resource custom name"
  type        = string
  default     = ""
}

variable "bastion_public_ip_allocation_method" {
  description = "Defines the allocation method for this IP address. Possible values are `Static` or `Dynamic`."
  type        = string
  default     = "Dynamic"
}

variable "bastion_public_ip_sku" {
  description = "The SKU of the Public IP. Accepted values are `Basic` and `Standard`."
  type        = string
  default     = "Standard"
}

variable "bastion_ipconfig_custom_name" {
  description = "Bastion IP Config custom name"
  type        = string
  default     = ""
}

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
