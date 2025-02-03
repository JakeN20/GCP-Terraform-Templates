// Define the resources to be deployed - https://cloud.google.com/docs/terraform/samples

# Enable required APIs
resource "google_project_service" "container_registry" {
  project = var.project_id
  service = "containerregistry.googleapis.com"
}

# Create the storage bucket for GCR (GCR uses a GCS bucket behind the scenes)
resource "google_storage_bucket" "gcr_bucket" {
  name          = "${var.project_id}-gcr"
  location      = var.region
  storage_class = "STANDARD"

  uniform_bucket_level_access = true
}

# IAM permissions for pushing & pulling images
resource "google_storage_bucket_iam_binding" "gcr_writer" {
  bucket = google_storage_bucket.gcr_bucket.name
  role   = var.iam_role

  members = [
    "serviceAccount:${var.gcr_service_account}"
  ]
}

resource "google_storage_bucket_iam_binding" "gcr_reader" {
  bucket = google_storage_bucket.gcr_bucket.name
  role   = "roles/storage.objectViewer"

  members = [
    "allAuthenticatedUsers"
  ]
}
