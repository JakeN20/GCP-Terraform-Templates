variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default     = "my-project-id"
}

variable "region" {
  description = "Region for the GCR bucket"
  type        = string
  default     = "US"
}

variable "iam_role" {
  description = "IAM role for the service account"
  type        = string
  default     = "roles/storage.objectAdmin"
}

variable "gcr_service_account" {
  description = "Service account for pushing images"
  type        = string
  default     = "serviceAccounthere"
}
