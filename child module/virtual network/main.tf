resource "azurerm_virtual_network" "vnet-block" {
  for_each = var.virtual_network_incedo
  name                = each.value.vnet_name
  address_space       = each.value.vnet_address_space
  location            = each.value.vnet_location
  resource_group_name = each.value.vnet_rg_name

  dynamic "subnet" {
    for_each = each.value.subnets
    content {
        name           = subnet.value.sub_name
        address_prefix = subnet.value.address_prefix
        }
    
  }
  
}