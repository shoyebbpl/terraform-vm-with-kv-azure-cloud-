data "azurerm_client_config" "current" {}


resource "azurerm_key_vault" "keyvault-block" {
    for_each = var.key_vault
  name                       = each.value.name
  location                   = each.value.location 
    resource_group_name        = each.value.resource_group_name
    tenant_id                  = data.azurerm_client_config.current.tenant_id
    sku_name                   = "standard"
    soft_delete_retention_days = 7
    purge_protection_enabled   = false

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Create",
      "Get",
      "Delete",
      "List",
    ]

    secret_permissions = [
      "Set",
      "Get",
      "Delete",
      "Purge",
      "Recover",
      "List"
    ]
  }
}

# resource "azurerm_key_vault_secret" "key-secret-username" {
#     for_each = var.key_vault
#   name         = each.value.user-name
#   value        = each.value.user-value
#   key_vault_id = azurerm_key_vault.keyvault-block[each.key].id
# }
# resource "azurerm_key_vault_secret" "key-secret-password" {
#     for_each = var.key_vault
#   name         = each.value.password-name
#   value        = each.value.password-value
#   key_vault_id = azurerm_key_vault.keyvault-block[each.key].id
# }