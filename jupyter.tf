# Try to avoid hard coding any variables. They should be vars or locals.

resource "kubernetes_namespace" "namespace" {
  metadata {
    name = var.namespace
  }
}

resource "kubernetes_deployment" "jupyter" {
  metadata {
    name      = local.deployment_name
    namespace = var.namespace
    labels = {
      app = local.app_label
    }
  }

  spec {
    selector {
      match_labels = {
        app = local.app_label
      }
    }

    template {
      metadata {
        labels = {
          app = local.app_label
        }
      }

      spec {
        container {
          image = var.image
          name  = local.name
        }
        port {
          name           = "http"
          container_port = 8888
        }
      }
    }
  }
}
