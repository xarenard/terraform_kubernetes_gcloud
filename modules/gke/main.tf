provider "google" {
  region      = "${var.region}"
  credentials = "${file("${var.credentials_file_path}")}"
}

resource "google_container_cluster" "container_cluster" {
  name                    = "${var.cluster_name}"
  zone                    = "${var.zone}"
  initial_node_count      = "${var.num_nodes}"
  project                 = "${var.project_name}"
  enable_kubernetes_alpha = "true"
  enable_legacy_abac      = "true"

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels {
      foo = "bar"
    }

    tags = ["foo", "bar"]
  }
}
