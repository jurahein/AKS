resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-learning-jh"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "aks-learning-jh"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }
  identity {
    type = "SystemAssigned"
  }
  

  network_profile {
    network_plugin     = "azure"
    load_balancer_sku  = "standard"
    outbound_type      = "loadBalancer"
    load_balancer_profile {
      outbound_ip_address_ids    = [azurerm_public_ip.aks_public_ip.id]
    }
  }
  api_server_access_profile {
    authorized_ip_ranges = [
      azurerm_public_ip.aks_public_ip.ip_address,
      "179.167.11.125/32" #ip internet maquina local
    ]
  }

}


resource "kubernetes_namespace" "app" {
  metadata {
    name = "app"
  }
}
resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"
  }
}  

# #Node extra
# resource "azurerm_kubernetes_cluster_node_pool" "nodepool2" {
#   name                  = "nodepool2"
#   kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
#   vm_size               = "Standard_DS2_v2"
#   node_count            = 1
#   mode                  = "System"

# }