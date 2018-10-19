project_name = "myproject"
credentials_file_path = "../creds/credential_file.json"

cluster_name = "mycluster"
num_nodes = "2"
zone = "europe-west2-a"
network_name = "mynetwork"
network_subnet_cidr = "10.127.0.0/20"
additional_zones = ["europe-west2-b","europe-west2-c"]
machine_type = "f1-micro"
region = "europe-west2"
container_port = "80"
container_name = "nginx"
service_port = "80"
image_name = "nginx:1.7.8"
namespace_label_name = "development"
namespace_annotation_name =  "development"
namespace_name = "development"
probe_http_port = "80"
probe_http_path = "/"
probe_http_host = ""
num_replica = "2"
probe_initial_delay = "5"




