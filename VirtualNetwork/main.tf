// Define the resources to be deployed - https://cloud.google.com/docs/terraform/samples

# Create a VPC Network
resource "google_compute_network" "vpc_network" {
  name                    = "var.vpc_name"
  auto_create_subnetworks = false # disable auto subnet creation
}

# Subnet creation
resource "google_compute_subnetwork" "subnet_1" {
  name          = "var.subnet_name"
  region        = "var.region"
  network       = google_compute_network.vpc_network.id
  ip_cidr_range = "10.1.0.0./24"
}

# Subnet creation
resource "google_compute_subnetwork" "subnet_2" {
  name          = "var.subnet_name_2"
  region        = "var.region"
  network       = google_compute_network.vpc_network.id
  ip_cidr_range = "10.1.0.0./24"
}

# Allow SSH, ICMP, and Internal Traffic
resource "google_compute_firewall" "allow_internal" {
  name    = "allow-internal"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "icmp"
  }

  source_ranges = ["10.0.0.0/8"]
}

resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}
