provider "google" {
  region      = "${var.region}"
  credentials = "${file("${var.credentials_file_path}")}"
  project     = "${var.project_name}"
}

resource "google_compute_network" "default" {
  name                    = "${var.network_name}"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "default" {
  name                     = "${var.network_name}"
  ip_cidr_range            = "${var.network_subnet_cidr}"
  network                  = "${google_compute_network.default.self_link}"
  region                   = "${var.region}"
  private_ip_google_access = true
}

resource "google_container_cluster" "container_cluster" {
  name                    = "${var.cluster_name}"
  zone                    = "${var.zone}"
  initial_node_count      = "${var.num_nodes}"
  project                 = "${var.project_name}"
  enable_kubernetes_alpha = "${var.enable_kubernetes_alpha}"
  enable_legacy_abac      = "true"
  additional_zones        = "${var.additional_zones}"

  network    = "${google_compute_subnetwork.default.name}"
  subnetwork = "${google_compute_subnetwork.default.name}"

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/compute",
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]

    labels {
      foo = "dev"
    }

    tags = ["dev"]
  }
}
