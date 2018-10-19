variable "cluster_name" {}

variable "num_nodes" {}

variable "zone" {}

variable "additional_zones" {
  type = "list"
}

variable "network_name" {}
variable "machine_type" {}

variable "project_name" {}

variable "credentials_file_path" {}

variable "region" {}

variable "container_port" {}

variable "service_port" {}

variable "image_name" {}

variable "namespace_label_name" {}

variable "namespace_annotation_name" {}

variable "namespace_name" {}

variable "probe_http_port" {}

variable "probe_http_path" {}

variable "probe_http_host" {}

variable "container_name" {}

variable "num_replica" {}

variable "probe_initial_delay" {}

variable "network_subnet_cidr" {}
