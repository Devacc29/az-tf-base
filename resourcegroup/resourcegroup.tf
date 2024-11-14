terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"
    }
  }
}


variable "resource_groups" {
  type = map(object({
    name     = string
    location = string
    tags     = map(string)
  }))
}

module "base_rg" {
  source          = "git::https://github.com/Devacc29/ACEO-MODULES.git//resourcegroup"
  resource_groups = var.resource_groups
}

