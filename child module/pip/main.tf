resource "azurerm_public_ip" "public_ip-block" {
    for_each = var.public_ip
  name                = each.value.pip_name
  resource_group_name = each.value.pip_resource_group_name
  location            = each.value.pip_location
  allocation_method   = "Static"
}