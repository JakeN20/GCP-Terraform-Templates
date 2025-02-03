variable "bucket_name" {
  description = "The name of the bucket to create"
  type        = string
  default     = "my-bucket"
}

variable "storage_class" {
  description = "The storage class of the bucket"
  type        = string
  default     = "STANDARD" # "NEARLINE" for infrequent access, "COLDLINE" for archival
}

variable "file_path" {
  description = "The path to the file to upload to the bucket"
  default     = "path/to/file"
}
