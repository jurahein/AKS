resource "azurerm_public_ip" "aks_public_ip" {
  name                = "aks-public-ip"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}