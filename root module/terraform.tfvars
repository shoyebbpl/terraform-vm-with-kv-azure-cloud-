incedo-rg = {
  rg1 = {
    name     = "incedo-rg1"
    location = "East US"

  }
  rg2 = {
    name     = "incedo-rg2"
    location = "East US"

  }

}
storage_incedo = {
  storage1 = {
    sto_name       = "incedostorage1"
    sto_location   = "East US"
    sto_rg_name    = "incedo-rg1"
    container_name = "container1"
  }
}
virtual_network_incedo = {
  vnet1 = {
    vnet_name          = "incedo-vnet1"
    vnet_address_space = ["10.0.0.0/16"]
    vnet_location      = "East US"
    vnet_rg_name       = "incedo-rg1"
    subnets = {
      subnet1 = {
        sub_name       = "subnet1"
        address_prefix = "10.0.1.0/26"
      }
      subnet2 = {
        sub_name       = "subnet2"
        address_prefix = "10.0.2.0/26"
      }

    }
  }
}
public_ip = {
  public_ip1 = {
    pip_name                = "incedo-public-ip1"
    pip_resource_group_name = "incedo-rg1"
    pip_location            = "East US"
  }
}
load_balancer = {
  lb1 = {
    name                    = "incedo-lb1"
    location                = "East US"
    resource_group_name     = "incedo-rg1"
    lb_name                 = "frontend-ip-config"
    pip_name                = "incedo-public-ip1"
    pip_location            = "East US"
    pip_resource_group_name = "incedo-rg1"
  }
}
virtual_machine = {
  vm1 = {
    kv_name        = "incedo-keyvault1"
    sub_name       = "subnet1"
    vnet_name      = "incedo-vnet1"
    vnet_rg_name   = "incedo-rg1"
    nic_name       = "incedo-nic1"
    nic_location   = "East US"
    nic_rg_name    = "incedo-rg1"
    ip_config_name = "ipconfig1"
    vm_name        = "incedo-vm1"
    # keyvault_name   = "vm1-username"
    # secrte_password = "vm1-password"
    password-name = "vm1-password"
    user-name     = "vm1-username"
    kv_rg_name    = "incedo-rg1"
    kv_password   = "vm1-password"
    kv_username   = "vm1-username"
  }
}
key_vault = {

  keyvault1 = {
    name                = "incedo-keyvault1"
    location            = "East US"
    resource_group_name = "incedo-rg1"
    # user-name           = "vm1-username"
    # user-value          = "adminuser"
    # password-name       = "vm1-password"
    # password-value      = "Password@1234"

  }
}