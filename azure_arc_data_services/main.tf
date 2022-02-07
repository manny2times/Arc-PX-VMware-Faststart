terraform {
  backend "azurerm" {}
}

data "terraform_remote_state" "state" {
  backend = "azurerm"
  config {
    resource_group_name  = var.resource_group
    storage_account_name = var.storage_account
    container_name       = var.storage_container
    key                  = var.storage_account_key 
  }
}

module "arc_ds_controller" {
  source = "./modules/arc_ds_controller"
  AZDATA_PASSWORD = var.AZDATA_PASSWORD
}

module "arc_ds_sp" {
  source = "./modules/arc_ds_sp"
}

module "arc_sql_mi" {
  source = "./modules/arc_sql_mi"
}
