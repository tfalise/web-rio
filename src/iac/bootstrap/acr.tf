resource "azurerm_container_registry" "acr" {
  name                  = "acrwebrioglobal"
  location              = var.location
  resource_group_name   = azurerm_resource_group.rg_bootstrap.name
  sku                   = "Basic"
  admin_enabled         = false
}