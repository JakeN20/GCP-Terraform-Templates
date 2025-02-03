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

variable "storage_class" {
  description = "Storage class for the GCR bucket"
  type        = string
  default     = "STANDARD"
}

variable "iam_write_role" {
  description = "IAM write role for the service account"
  type        = string
  default     = "roles/storage.objectAdmin"
}

variable "iam_read_role" {
  description = "IAM read role for the service account"
  type        = string
  default     = "roles/storage.objectViewer"
}

variable "gcr_service_account" {
  description = "Service account for pushing images"
  type        = string
  default     = "serviceAccounthere"
}
