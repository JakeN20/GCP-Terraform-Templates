// Define the resources to be deployed - https://cloud.google.com/docs/terraform/samples

## Create a Compute Engine instance with an ephemeral IP ##
resource "google_compute_instance" "example" {
    name         = "instance-example"
    machine_type = "e2-micro"
    zone         = "us-central1-a"

    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-9"
            size  = 50 # Disk size in GB
            type  = "pd-standard" # Options: "pd-ssd", "pd-balanced" ..etc
        }
    }

    network_interface {
        network = "default" # Change if using a custom VPC
        access_config { } # Ephemeral IP, required for assigning a public IP
    }
}
