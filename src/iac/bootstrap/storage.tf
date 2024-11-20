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