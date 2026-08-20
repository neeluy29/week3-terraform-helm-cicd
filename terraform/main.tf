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
  tags = {
    environment = "miniproject-4"
  }
}

resource "azurerm_storage_account" "mini_project" {
  name                     = "stweek3miniproj09"
  resource_group_name      = azurerm_resource_group.mini_project.name
  location                 = azurerm_resource_group.mini_project.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    environment = "miniproject-3"
    
  }
}
resource "azurerm_key_vault" "mini_project" {
  name                       = "kv-week3-secrets09"
  location                   = azurerm_resource_group.mini_project.location
  resource_group_name        = azurerm_resource_group.mini_project.name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "standard"
  enable_rbac_authorization  = true

  tags = {
    environment = "week3-miniproject-1"
  }
}

data "azurerm_client_config" "current" {}