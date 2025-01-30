// Define the Google Cloud Storage (GCS) backend for storing the Terraform state file
terraform {
  backend "gcs" {
    bucket  = "terraform-state-bucket"
    path    = "terraform-state/terrafor.tfstate"
    prefix  = "terraform/state" // Optional
  }
}