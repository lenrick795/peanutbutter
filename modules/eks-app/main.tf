
resource "kubernetes_namespace" "this" {
  metadata {
    name = format("%s-%s", var.name, var.environment)
  }
}
resource "kubernetes_deployment" "eks_app" {
  metadata {
    name = format("%s-%s", var.name, var.environment)
    labels = {
      app = format("%s-%s", var.name, var.environment)
    }
    namespace = format("%s-%s", var.name, var.environment)
  }

  spec {
    replicas = var.replicas

    selector {
      match_labels = {
        app = format("%s-%s", var.name, var.environment)
      }
    }

    template {
      metadata {
        labels = {
          app = format("%s-%s", var.name, var.environment)
        }
      }

      spec {
        container {
          image = var.image
          name  = var.container_name

          port {
            container_port = var.container_port
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "eks_service" {
  metadata {
    name = format("%s-%s", var.name, var.environment)
    namespace = format("%s-%s", var.name, var.environment)
  }

  spec {
    selector = {
      app = format("%s-%s", var.name, var.environment)
    }

    port {
      port        = 80
      target_port = var.container_port
    }

    type = "LoadBalancer"
  }
}