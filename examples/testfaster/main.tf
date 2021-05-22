variable "namespace" {
  description = "The namespace to install into."
  default     = "jupyter"
  type        = string
}

resource "kubernetes_namespace" "namespace" {
  metadata {
    name = var.namespace
  }
}

module "jupyter" {
  source    = "combinator-ml/jupyter/k8s"
  namespace = var.namespace
  depends_on = [
    kubernetes_namespace.namespace
  ]
}

resource "kubernetes_service" "jupyter" {
  metadata {
    name      = "testfaster-jupyter"
    namespace = var.namespace
  }
  spec {
    selector = {
      app = "combinator-jupyter"
    }
    port {
      name        = "http"
      port        = 8888
      target_port = 8888
      node_port   = 30600
    }
    type = "NodePort"
  }
  depends_on = [
    module.jupyter
  ]
}
