resource "azurerm_resource_group" "rg_common" {
  name = "rg-webrio-common-${var.env}"
  location = var.location
}

resource "azurerm_container_registry" "acr" {
  name                  = "acrwebrio${var.env}"
  location              = var.location
  resource_group_name   = azurerm_resource_group.rg_common.name
  sku                   = "Basic"
  admin_enabled         = false
}