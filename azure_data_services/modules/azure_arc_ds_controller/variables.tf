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

variable "infrastructure" {
  description = "Infrastructure to deploy controller to, one of: alibaba, aws, azure, gcp, onpremises, other"
  type        = string
}

variable "service_type" {
  description = "Kubernetes service type for controller: LoadBalancer or NodePort"
  type        = string
  default     = "NodePort"
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

variable "data_storage_class" {
  description = "Storage class for metadata database data"
  type        = string
  default     = "portworx-sc" 
}

variable "logs_storage_class" {
  description = "Storage class for metadata database tlog"
  type        = string
  default     = "portworx-sc" 
}
