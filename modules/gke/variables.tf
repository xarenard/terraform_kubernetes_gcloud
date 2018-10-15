variable "cluster_name" {
  type    = "string"
  default = "mycluster"
}

variable "num_nodes" {
  type    = "string"
  default = "3"
}

variable "zone" {
  type    = "string"
  default = "europe-west2-a"
}

variable "machine_type" {
  type    = "string"
  default = "f1-micro"
}

variable "project_name" {
  type = "string"
}

variable "region" {
  type = "string"
}

variable "credentials_file_path" {
  type = "string"
}
