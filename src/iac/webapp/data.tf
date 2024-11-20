data "azurerm_resource_group" "rg_bootstrap" {
    name = "rg-webrio-bootstrap"
}

data "azurerm_container_registry" "acr_global" {
    name = "acrwebrioglobal"
    resource_group_name = data.azurerm_resource_group.rg_bootstrap.name
}