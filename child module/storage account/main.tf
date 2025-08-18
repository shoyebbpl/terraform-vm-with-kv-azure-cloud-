resource "azurerm_storage_account" "st-block" {
    for_each = var.storage_incedo
  name = each.value.sto_name
  location = each.value.sto_location
  resource_group_name = each.value.sto_rg_name
    account_tier = "Standard"
    account_replication_type = "LRS"
}
resource "azurerm_storage_container" "cont-block" {
    for_each = var.storage_incedo
  name                  = each.value.container_name
  storage_account_name  = azurerm_storage_account.st-block[each.key].name
  container_access_type = "private"
}