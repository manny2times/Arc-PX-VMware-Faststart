terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "1.4.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.48.0"
    }
  }
}

provider "azurerm" {
  features {}
  alias   = "azure_rm"
}

provider "azuread" {
  tenant_id = "5a3d1859-f4b7-4151-beae-773895b989fd"
}

module "azure_blob_storage" {
  source = "./modules/azure_blob_storage"
}

module "arc_ds_sp" {
  source = "./modules/arc_ds_sp"
}
