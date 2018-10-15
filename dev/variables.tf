variable "project_name" {
  type = "string"
}

variable "credentials_file_path" {
  type = "string"
}

variable "region" {
  type    = "string"
  default = "eu-west2"
}

variable "container_port" {
  type    = "string"
  default = "80"
}

variable "service_port" {
  type    = "string"
  default = "80"
}

variable "image_name" {
  type    = "string"
  default = "nginx:1.7.8"
}

variable "namespace_label_name" {
  type    = "string"
  default = "development"
}

variable "namespace_annotation_name" {
  type    = "string"
  default = "development"
}

variable "namespace_name" {
  type    = "string"
  default = "development"
}
