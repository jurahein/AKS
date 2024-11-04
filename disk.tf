resource "azurerm_managed_disk" "disk" {
  name                  = "diskstorageaks"
  location              = var.location
  resource_group_name   = data.azurerm_resource_group.aks_rg.name
  storage_account_type  = "StandardSSD_LRS"
  create_option         = "Empty"
  disk_size_gb          = "4"

}