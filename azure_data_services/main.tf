module "azure_arc_ds_controller" {
  source = "./modules/azure_arc_ds_controller"
  infrastructure            = var.infrastructure
  metrics_ui_admin_user     = var.metrics_ui_admin_user
  metrics_ui_admin_password = var.metrics_ui_admin_password
  logs_ui_admin_user        = var.logs_ui_admin_user
  logs_ui_admin_password    = var.logs_ui_admin_password
  subscription_id           = var.subscription_id
  azure_region              = var.azure_region
}

#module "azure_arc_kubernetes" {
#  source = "./modules/azure_arc_kubernetes"
#}
