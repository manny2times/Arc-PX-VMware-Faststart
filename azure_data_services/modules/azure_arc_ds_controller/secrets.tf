resource "kubernetes_secret" "metrics_admin_secret" {
  metadata {
    name = "metricsui-admin-secret"
  }

  data = {
    username = var.metrics_ui_admin_user
    password = var.metrics_ui_admin_password
  }
}

resource "kubernetes_secret" "logsui_admin_secret" {
  metadata {
    name = "logsui-admin-secret"
  }

  data = {
    username = var.logs_ui_admin_user
    password = var.logs_ui_admin_password
  }
}
