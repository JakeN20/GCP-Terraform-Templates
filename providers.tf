// Define the required providers for the Terraform configuration
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.18.1"
    }
  }
}

provider "google" {
  # Configuration options
  project = "PROJECT_ID"
  region  = "us-central1"
  zone    = "us-central1"
}
