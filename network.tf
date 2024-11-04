resource "azurerm_network_security_group" "sg" {
  name                = "estudosjuraci"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg_network.name
}

resource "azurerm_virtual_network" "vnet" {
  name                = "estudosjuraci-network"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "juraciVM"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "juraciAKS"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.sg.id
  }

}