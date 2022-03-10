variable "namespace" {
  description = "Kubernetes namespace for Azure Arc for Data Services controller"
  type        = string
  default     = "arc"
}

variable "metrics_ui_admin_user" {
  description = "Metrics UI admin user username"
  type        = string
  sensitive   = true 
}

variable "metrics_ui_admin_password" {
  description = "Metrics UI admin user password"
  type        = string
  sensitive   = true 
}

variable "logs_ui_admin_user" {
  description = "Logs UI admin user username"
  type        = string
  sensitive   = true 
}

variable "logs_ui_admin_password" {
  description = "Logs UI admin user password"
  type        = string
  sensitive   = true 
}

variable "image_tag" {
  description = "Controller container image tag"
  type        = string
}

variable "infrastructure" {
  description = "Infrastructure to deploy controller to, one of: alibaba, aws, azure, gcp, onpremises, other"
  type        = string
}

variable "connection_mode" {
  description = "Controller connection mode: direct or indirect"
  type        = string
  default     = "indirect"
}

variable "azure_region" {
  description = "Azure region to register controller with"
  type        = string
  default     = "eastus"
}

variable "resource_group" {
  description = "Resource group to create controller objects in"
  type        = string
  default     = "arc-ds-controller"
}

variable "subscription_id" {
  description = "Azure subscription id"
  type        = string
  sensitive   = true
}

variable "secret_username" {
  type    = string
}

variable "secret_password" {
  type    = string
}

variable "instance_name" {
  type    = string
  default = "sqlmi3"
}

variable "cpu_request" {
  default = 4
}

variable "cpu_limit" {
  default = 4
}

variable "memory_request" {
  type    = string
  default = "2Gi"
}

variable "memory_limit" {
  type    = string
  default = "4Gi"
}

variable "service_type" {
  type    = string
  default = "LoadBalancer"
}

variable "backups_storage_class" {
  type    = string
  default = "portworx-sc"
}

variable "volume_size_backups" {
  type    = string
  default = "5Gi"
}

variable "data_storage_class" {
  type    = string
  default = "portworx-sc"
}

variable "volume_size_data" {
  type    = string
  default = "5Gi"
}

variable "data_logs_storage_class" {
  type    = string
  default = "portworx-sc"
}

variable "volume_size_data_logs" {
  type    = string
  default = "5Gi"
}

variable "logs_storage_class" {
  type    = string
  default = "portworx-sc"
}

variable "volume_size_logs" {
  type    = string
  default = "5Gi"
}
