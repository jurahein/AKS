resource "azurerm_resource_group" "rg" {
    name = "RG-AKS-JURACI"
    location = var.location
}

resource "azurerm_resource_group" "rg_network" {
    name = "RG-NETWORK-JURACI"
    location = var.location
}