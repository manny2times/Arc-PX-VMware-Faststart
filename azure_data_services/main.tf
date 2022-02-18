module "arc_ds_controller" {
  source = "./modules/arc_ds_controller"
  image_tag                 = var.image_tag
  infrastructure            = var.infrastructure
  metrics_ui_admin_user     = var.metrics_ui_admin_user
  metrics_ui_admin_password = var.metrics_ui_admin_password
  logs_ui_admin_user        = var.logs_ui_admin_user
  logs_ui_admin_password    = var.logs_ui_admin_password
  subscription_id           = var.subscription_id
  azure_region              = var.azure_region
  data_storage_class        = var.data_storage_class
  logs_storage_class        = var.logs_storage_class
}

module "arc_sql_mi" {
  source = "./modules/arc_sql_mi"
  secret_username         = var.secret_username
  secret_password         = var.secret_password
  namespace               = var.namespace
  instance_name           = var.instance_name
  cpu_request             = var.cpu_request
  memory_request          = var.memory_request
  memory_limit            = var.memory_limit 
  service_type            = var.service_type
  backups_storage_class   = var.backups_storage_class
  volume_size_backups     = var.volume_size_backups
  data_storage_class      = var.data_storage_class
  volume_size_data        = var.volume_size_data
  data_logs_storage_class = var.data_logs_storage_class
  volume_size_data_logs   = var.volume_size_data_logs
  logs_storage_class      = var.logs_storage_class
  volume_size_logs        = var.volume_size_logs
}
