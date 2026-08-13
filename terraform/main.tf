terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
backend "azurerm" {
    resource_group_name  = "rg-week3-miniproject"
    storage_account_name = "stweek3miniproj09"
    container_name       = "tfstate"
    key                  = "miniproject.tfstate"
}
}
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "mini_project" {
  name     = "rg-week3-miniproject"
  location = "Central India"
}

resource "azurerm_storage_account" "mini_project" {
  name                     = "stweek3miniproj09"
  resource_group_name      = azurerm_resource_group.mini_project.name
  location                 = azurerm_resource_group.mini_project.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}