data "azurerm_resource_group" "aks_rg" {
  name = format("MC_%s_%s_%s", azurerm_resource_group.rg.name, azurerm_kubernetes_cluster.aks.name, var.location)
}

resource "azurerm_role_assignment" "aks_network_contributor_rg" {
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name = "Network Contributor"
  scope                = azurerm_resource_group.rg_network.id
}

resource "azurerm_role_assignment" "aks_network_contributor_rg_aks" {
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name = "Network Contributor"
  scope                = azurerm_resource_group.rg.id
}


resource "azurerm_role_assignment" "aks_network_contributor_mc_rg" {
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name = "Network Contributor"
  scope                = data.azurerm_resource_group.aks_rg.id
}


resource "azurerm_role_assignment" "principal_id_aks_network_contributor_rg" {
  principal_id         = azurerm_kubernetes_cluster.aks.identity[0].principal_id
  role_definition_name = "Network Contributor"
  scope                = azurerm_resource_group.rg.id
}


resource "azurerm_role_assignment" "principal_id_aks_network_contributor_rg_network" {
  principal_id         = azurerm_kubernetes_cluster.aks.identity[0].principal_id
  role_definition_name = "Network Contributor"
  scope                = azurerm_resource_group.rg_network.id
}


resource "azurerm_role_assignment" "principal_id_aks_network_contributor_mc_rg" {
  principal_id         = azurerm_kubernetes_cluster.aks.identity[0].principal_id
  role_definition_name = "Network Contributor"
  scope                = data.azurerm_resource_group.aks_rg.id
}

