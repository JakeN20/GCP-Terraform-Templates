# Output GKE details
output "gke_cluster_name" {
  value = google_container_cluster.gke_cluster.name
}

output "gke_endpoint" {
  value = google_container_cluster.gke_cluster.endpoint
}
