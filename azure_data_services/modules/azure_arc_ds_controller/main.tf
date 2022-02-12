terraform {
  required_version = ">= 0.13"

  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }
}

provider "kubernetes" {
  experiments {
    manifest_resource = true
  }

  config_path = "~/.kube/config"
}

resource "kubernetes_namespace" "controller_namespace" {
  metadata {
    name = var.namespace
  }

  depends_on = [
     kubectl_manifest.data_controller_crd
    ,kubectl_manifest.postgres_crd
    ,kubectl_manifest.sqlmi_crd
    ,kubectl_manifest.sql_restore_crd
    ,kubectl_manifest.export_tasks_crd
    ,kubectl_manifest.monitors_crd
    ,kubectl_manifest.dags_crd
    ,kubectl_manifest.adc_crd
  ]
}
