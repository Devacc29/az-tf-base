terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.1.0"
    }
  }
}

provider "azurerm" {
  resource_provider_registrations = "none"
  subscription_id                 = "c92973e5-7f67-4bc4-af10-1ed1c2f696c1"
  features {}
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