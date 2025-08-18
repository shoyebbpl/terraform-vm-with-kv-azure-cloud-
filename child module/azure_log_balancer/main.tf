resource "azurerm_lb" "lb-block" {
    for_each = var.load_balancer
    name                = each.value.name   
    location            = each.value.location
    resource_group_name = each.value.resource_group_name

  frontend_ip_configuration {
    name                 = each.value.lb_name
    public_ip_address_id = data.azurerm_public_ip.public_ip-block[each.key].id
  }
}

data "azurerm_public_ip" "public_ip-block" {
    for_each = var.load_balancer
      name                = each.value.pip_name
  resource_group_name = each.value.pip_resource_group_name
  
}