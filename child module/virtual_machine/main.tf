data "azurerm_subnet" "sub-block" {
    for_each = var.virtual_machine
  name                 = each.value.sub_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.vnet_rg_name
  
}
data "azurerm_key_vault" "kv-block" {
    for_each = var.virtual_machine
  name                = each.value.kv_name
  resource_group_name = each.value.kv_rg_name
}
data "azurerm_key_vault_secret" "vm1-username" {
    for_each = var.virtual_machine
  name                = each.value.kv_username
  key_vault_id = data.azurerm_key_vault.kv-block[each.key].id
}
data "azurerm_key_vault_secret" "vm1-password" {
    for_each = var.virtual_machine
  name                = each.value.kv_password
  key_vault_id = data.azurerm_key_vault.kv-block[each.key].id
  
}

resource "azurerm_network_interface" "nic-block" {
    for_each = var.virtual_machine
  name                = each.value.nic_name
  location            = each.value.nic_location
  resource_group_name = each.value.nic_rg_name
  ip_configuration {
    name                          = each.value.ip_config_name
    subnet_id                     = data.azurerm_subnet.sub-block[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "vm-block" {
    for_each = var.virtual_machine
  name                  = each.value.vm_name
    location              = each.value.nic_location  
    resource_group_name   = each.value.nic_rg_name
  network_interface_ids = [azurerm_network_interface.nic-block[each.key].id]
  vm_size               = "Standard_B2s"
os_profile_linux_config {
    disable_password_authentication = false
  }
 
storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = data.azurerm_key_vault_secret.vm1-username[each.key].value
    admin_password = data.azurerm_key_vault_secret.vm1-password[each.key].value
  }
  }
 