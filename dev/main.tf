module "cluster" {
  source                = "../modules/gke"
  project_name          = "${var.project_name}"
  credentials_file_path = "${var.credentials_file_path}"
  region                = "${var.region}"
}

module "k8s" {
  source                    = "../modules/k8s"
  container_port            = "${var.container_port}"
  service_port              = "${var.service_port}"
  image_name                = "${var.image_name}"
  endpoint                  = "${module.cluster.cluster_endpoint}"
  client_certificate        = "${module.cluster.client_certificate}"
  client_key                = "${module.cluster.client_key}"
  cluster_ca_certificate    = "${module.cluster.cluster_ca_certificate}"
  namespace_annotation_name = "${var.namespace_annotation_name}"
  namespace_label_name      = "${var.namespace_label_name}"
  namespace_name            = "${var.namespace_name}"
}
