// Define the resources to be deployed - https://cloud.google.com/docs/terraform/samples

## Create a SQL database instance with a database and user ##
# Enable required APIs
resource "google_project_service" "container_api" {
  project = var.project_id
  service = "container.googleapis.com"
}

# Create the GKE Cluster
resource "google_container_cluster" "gke_cluster" {
  name     = var.cluster_name
  location = var.region

  remove_default_node_pool = true
  initial_node_count       = 1

  networking_mode = "VPC_NATIVE"

  ip_allocation_policy {}

  # Enable Kubernetes RBAC
  enable_legacy_abac = false
}

# Create a separate node pool
resource "google_container_node_pool" "node_pool" {
  name       = var.node_pool_name
  cluster    = google_container_cluster.gke_cluster.id
  location   = var.region
  node_count = var.node_count

  autoscaling {
    min_node_count = 1
    max_node_count = 3
  }

  node_config {
    machine_type = var.machine_type

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}
