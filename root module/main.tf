module "resource_module" {
  source    = "../child module/resource group"
  incedo-rg = var.incedo-rg

}
module "storage_module" {
  depends_on     = [module.resource_module]
  source         = "../child module/storage account"
  storage_incedo = var.storage_incedo

}
module "vnet_module" {
  depends_on             = [module.resource_module, module.storage_module]
  source                 = "../child module/virtual network"
  virtual_network_incedo = var.virtual_network_incedo

}
module "public_ip_module" {
  depends_on = [module.resource_module, module.storage_module]
  source     = "../child module/pip"
  public_ip  = var.public_ip


}
module "lb_module" {
  depends_on    = [module.resource_module, module.public_ip_module, module.storage_module]
  source        = "../child module/azure_log_balancer"
  load_balancer = var.load_balancer

}
module "azurerm_key_vault" {
  depends_on = [module.resource_module, module.storage_module]
  source     = "../child module/keyvault"
  key_vault  = var.key_vault

}

module "azurerm_vm" {
  depends_on      = [module.resource_module, module.azurerm_key_vault, module.vnet_module]
  source          = "../child module/virtual_machine"
  virtual_machine = var.virtual_machine
}
