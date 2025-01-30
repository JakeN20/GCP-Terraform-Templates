// Define the resources to be deployed - https://cloud.google.com/docs/terraform/samples

resource "random_id" "bucket_prefix" {
  byte_length = 8
}

## Create a storage bucket with versioning and a lifecycle rule ##
resource "google_storage_bucket" "example" {
    name     = "${random_id.bucket_prefix.hex}-bucket-example"
    location = "US"
    storage_class = "STANDARD"  # "NEARLINE" for infrequent access, "COLDLINE" for archival

    uniform_bucket_level_access = true # Enforce uniform bucket-level access if necessary

    versioning {
        enabled = true
    }

    lifecycle_rule {
        condition {
            age = 30
        }
        action {
            type = "Delete"
        }
    }
}

## Upload a file to the bucket ##
resource "google_storage_bucket_object" "default" {
    name   = "default-object"
    bucket = google_storage_bucket.example.id
    source = var.file_path # Path to the file to upload
    content = "Data to be stored in the object"
    content_type = "text/plain"  # "application/json" for JSON, "image/png" for images
}

data "google_storage_bucket_object" "default" {
    name   = google_storage_bucket_object.default.name
    bucket = google_storage_bucket_object.default.id
}

data "google_storage_bucket" "default" {
    name = google_storage_bucket.example.id
}