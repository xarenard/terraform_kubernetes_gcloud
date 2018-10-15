provider "kubernetes" {
  host = "${var.endpoint}"

  client_certificate     = "${base64decode("${var.client_certificate}")}"
  client_key             = "${base64decode("${var.client_key}")}"
  cluster_ca_certificate = "${base64decode("${var.cluster_ca_certificate}")}"
}

resource "kubernetes_pod" "nginx" {
  metadata {
    name = "nginx-example"

    labels {
      App = "nginx"
    }
  }

  spec {
    container {
      image = "nginx:1.7.8"
      name  = "example"

      port {
        container_port = "${var.container_port}"
      }
    }
  }
}

resource "kubernetes_service" "nginx" {
  metadata {
    name = "nginx-example"
  }

  spec {
    selector {
      App = "${kubernetes_pod.nginx.metadata.0.labels.App}"
    }

    port {
      port        = "${var.service_port}"
      target_port = "${var.container_port}"
    }

    type = "LoadBalancer"
  }
}
