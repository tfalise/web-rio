import {
    to = azurerm_resource_group.rg_bootstrap
    id = data.azurerm_resource_group.rg_bootstrap.id
}

resource "azurerm_resource_group" "rg_bootstrap" {
    name = "rg-webrio-bootstrap"
    location = data.azurerm_resource_group.rg_bootstrap.location
}