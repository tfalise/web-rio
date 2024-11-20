import {
    to = azurerm_container_registry.acr_global
    id = data.azurerm_container_registry.acr_global.id
}

resource "azurerm_container_registry" "acr_global" {
    name                  = "acrwebrioglobal"
    location              = data.azurerm_container_registry.acr_global.location
    resource_group_name   = data.azurerm_container_registry.acr_global.resource_group_name
}