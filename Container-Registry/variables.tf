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

variable "gcr_service_account" {
  description = "Service account for pushing images"
  type        = string
  default     = "serviceAccount:"
}
