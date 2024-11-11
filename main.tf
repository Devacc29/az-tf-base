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

resource "azurerm_resource_group" "rg" {
  name     = "az-tf-str-rg-01"
  location = "eastus2"
}

resource "azurerm_storage_account" "str" {
  name                     = "aztfstr01"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "cnt" {
  name                  = "base-tf-state"
  storage_account_name  = azurerm_storage_account.str.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "blb" {
  name                   = "base-tfstate"
  storage_account_name   = azurerm_storage_account.str.name
  storage_container_name = azurerm_storage_container.cnt.name
  type                   = "Block"
  source                 = "terraform.tfstate"
}