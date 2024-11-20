data "azurerm_resource_group" "rg_boostrap" {
    name = "rg-webrio-bootstrap"
}

data "azurerm_storage_account" "tfm_storage_account" {
    name = "sawebriotfstate"
    resource_group_name = data.azurerm_resource_group.rg_boostrap.name
}