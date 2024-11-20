# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.9.0"
    }
  }

  backend "azurerm" { }

  required_version = ">= 0.14.9"
}

provider "azurerm" {
  subscription_id = "9e718aa6-5df6-4dca-8855-8e307186865d"
  features {}
}

# Create the resource group
resource "azurerm_resource_group" "rg_app" {
  name     = "rg-webrio-${var.env}"
  location = var.location
}

# Create the Linux App Service Plan
resource "azurerm_service_plan" "appserviceplan" {
  name                = "asp-webrio-${var.env}"
  location            = azurerm_resource_group.rg_app.location
  resource_group_name = azurerm_resource_group.rg_app.name
  os_type             = "Linux"
  sku_name            = "B1"
}

resource "azurerm_linux_web_app" "webapp" {
  name = "app-webrio-${var.env}"
  location = azurerm_resource_group.rg_app.location
  resource_group_name = azurerm_resource_group.rg_app.name
  service_plan_id = azurerm_service_plan.appserviceplan.id

  site_config {
    always_on = true
    container_registry_use_managed_identity = true
    application_stack {
      docker_image_name = "tfalise/webrio"
      docker_registry_url = "https://${azurerm_container_registry.acr_global.login_server}"
    }
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_role_assignment" "acr_pull" {
  principal_id                     = azurerm_linux_web_app.webapp.identity.0.principal_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr_global.id
  skip_service_principal_aad_check = true
}
  