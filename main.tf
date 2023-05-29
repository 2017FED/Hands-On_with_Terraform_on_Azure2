terraform {
  required_version = ">= 1.3.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }
    cloud {
    organization = "ParminderSaini"

    workspaces {
      name = "Hands-On_With_Terraform_On_Azure2"
    }
}
provider "azurerm" {
  features {}
  skip_provider_registration = true
}
resource "azurerm_resource_group" "rg1" {
  name     = "813-6423e16e-hands-on-with-terraform-on-azure"
  location = "East US"
}
module "securestorage" {
  source               = "app.terraform.io/ParminderSaini/securestorage/arm"
  version              = "1.0.0"
  location             = azurerm_resource_group.rg1.location
  resource_group_name  = azurerm_resource_group.rg1.name
  storage_account_name = "storagepam"
}
