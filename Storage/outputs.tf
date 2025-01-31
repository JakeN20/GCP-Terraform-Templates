
output "url" {
  value = google_storage_bucket.example.url
}

output "object_metadata" {
  value = data.google_storage_bucket_object.default
}

output "bucket_metadata" {
  value = data.google_storage_bucket.default
}
