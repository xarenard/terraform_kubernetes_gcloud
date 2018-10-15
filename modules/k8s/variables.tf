variable "endpoint" {}

variable "service_port" {}

variable "container_port" {}

variable "client_certificate" {}

variable "client_key" {}

variable "cluster_ca_certificate" {}

variable "image_name" {}

variable "namespace_label_name" {}

variable "namespace_annotation_name" {}

variable "namespace_name" {}

variable "probe_http_port" {}

variable "probe_http_path" {}

variable "container_name" {}

variable "num_replica" {}

variable "probe_initial_delay" {
  default = "5"
}

variable "probe_period_seconds" {
  default = "60"
}

variable "probe_http_host" {
  default = ""
}
