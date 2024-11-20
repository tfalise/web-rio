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