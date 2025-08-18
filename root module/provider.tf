terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}
provider "azurerm" {
  features {}

  subscription_id = "9b62c102-bd6b-4b0f-a21e-c84efd2afe97"

}
