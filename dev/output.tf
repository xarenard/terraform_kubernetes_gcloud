output "cluster_endpoint" {
  value = "${module.cluster.cluster_endpoint}"
}

output "lb_endpoint" {
  value = "${module.k8s.lb_ip}"
}
