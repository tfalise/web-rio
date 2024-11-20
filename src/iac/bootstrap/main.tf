
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.9.0"
    }
  }
  
  required_version = ">= 0.14.9"
}

provider "azurerm" {
  subscription_id = "9e718aa6-5df6-4dca-8855-8e307186865d"
  features {}
}

import {
    to = azurerm_storage_account.tfm_storage
    id = data.azurerm_storage_account.tfm_storage_account.id
}

resource "azurerm_storage_account" "tfm_storage" {
    name                        = "sawebriotfstate"
    resource_group_name         = data.azurerm_storage_account.tfm_storage_account.resource_group_name
    location                    = data.azurerm_storage_account.tfm_storage_account.location
    account_tier                = "Standard"
    account_replication_type    = "LRS"
}