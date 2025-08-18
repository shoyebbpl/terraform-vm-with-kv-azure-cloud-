
terraform {
  backend "azurerm" {
    resource_group_name  = "incedo-rg1"
    storage_account_name = "incedostorage1" # <- use module output
    container_name       = "container1"
    key                  = "envs/dev/terraform.tfstate"
  }
}
