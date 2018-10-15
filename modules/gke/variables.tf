variable "cluster_name" {}

variable "num_nodes" {}

variable "zone" {}

variable "machine_type" {}

variable "project_name" {}

variable "region" {}

variable "credentials_file_path" {}

variable "enable_kubernetes_alpha" {
  default = "true"
}
