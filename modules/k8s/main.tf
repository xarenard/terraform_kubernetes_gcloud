provider "kubernetes" {
  host                   = "${var.endpoint}"
  client_certificate     = "${base64decode("${var.client_certificate}")}"
  client_key             = "${base64decode("${var.client_key}")}"
  cluster_ca_certificate = "${base64decode("${var.cluster_ca_certificate}")}"
}

resource "kubernetes_namespace" "namespace" {
  metadata {
    annotations {
      name = "${var.namespace_annotation_name}"
    }

    labels {
      mylabel = "${var.namespace_label_name}"
    }

    name = "${var.namespace_name}"
  }
}

resource "kubernetes_replication_controller" "replication_controller" {
  metadata {
    namespace = "${kubernetes_namespace.namespace.id}"

    name = "${var.container_name}"

    labels {
      App = "${var.container_name}"
    }
  }

  spec {
    replicas = "${var.num_replica}"

    selector {
      App = "${var.container_name}"
    }

    template {
      container {
        image = "${var.image_name}"
        name  = "${var.container_name}"

        readiness_probe {
          initial_delay_seconds = "${var.probe_initial_delay}"
          period_seconds        = "${var.probe_period_seconds}"

          http_get {
            path = "${var.probe_http_path}"
            port = "${var.probe_http_port}"
            host = "${var.probe_http_host}"
          }
        }

        port {
          container_port = "${var.container_port}"
        }

        resources {
          limits {
            cpu    = "0.5"
            memory = "512Mi"
          }

          requests {
            cpu    = "250m"
            memory = "50Mi"
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "service" {
  metadata {
    name      = "${var.container_name}-service"
    namespace = "${kubernetes_namespace.namespace.id}"
  }

  spec {
    selector {
      App = "${kubernetes_replication_controller.replication_controller.metadata.0.labels.App}"
    }

    port {
      port        = "${var.service_port}"
      target_port = "${var.container_port}"
    }

    type = "LoadBalancer"
  }
}
