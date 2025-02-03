
# Output VPC details
output "vpc_name" {
  value = google_compute_network.vpc_network.name
}

output "subnet_1_cidr" {
  value = google_compute_subnetwork.subnet_1.ip_cidr_range
}

output "subnet_2_cidr" {
  value = google_compute_subnetwork.subnet_2.ip_cidr_range
}
