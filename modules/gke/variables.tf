variable "cluster_name" {}

variable "num_nodes" {}

variable "zone" {}

variable "additional_zones" {
  type    = "list"
  default = []
}

variable "network_name" {}

variable "machine_type" {}

variable "project_name" {}

variable "region" {}

variable "credentials_file_path" {}

variable "enable_kubernetes_alpha" {
  default = "true"
}

variable "network_subnet_cidr" {}
