variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
  default     = "gke-cluster"
}

variable "region" {
  description = "Region for the GKE cluster/node pool"
  type        = string
  default     = "us-central1"
}

variable "node_pool_name" {
  description = "Name of the node pool"
  type        = string
  default     = "node-pool"
}

variable "node_count" {
  description = "Initial number of nodes in the pool"
  type        = number
  default     = 2
}

variable "machine_type" {
  description = "Machine type for the nodes"
  type        = string
  default     = "e2-medium"
}
