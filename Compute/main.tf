// Define the resources to be deployed - https://cloud.google.com/docs/terraform/samples

## Create a Compute Engine instance with an ephemeral IP ##
resource "google_compute_instance" "example" {
  name         = var.instance_name
  machine_type = var.instance_type
  zone         = var.instance_zone

  boot_disk {
    initialize_params {
      image = var.disk_image
      size  = var.disk_size
      type  = var.disk_type
    }
  }

  network_interface {
    network = var.network_name # Change if using a custom VPC
    access_config {}    # Ephemeral IP, required for assigning a public IP
  }
}
