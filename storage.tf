resource "azurerm_storage_account" "storage" {
  name                     = "stgeaksjuraci"
  location                 = var.location
  resource_group_name      = azurerm_resource_group.rg.name
  account_tier             = "Standard"
  account_replication_type = "LRS"

}
resource "azurerm_storage_share" "share" {
  name                 = "aksshare"
  storage_account_name = azurerm_storage_account.storage.name
  quota                = 50

}