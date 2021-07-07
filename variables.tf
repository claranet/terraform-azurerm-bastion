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

variable "extra_tags" {
  description = "Additional tags to associate with resources."
  type        = map(string)
  default     = {}
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
