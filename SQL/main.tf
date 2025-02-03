// Define the resources to be deployed - https://cloud.google.com/docs/terraform/samples

## Create a SQL database instance with a database and user ##
resource "google_sql_database_instance" "instance-example" {
  name             = var.sql_server_name
  database_version = "MYSQL_8_0"
  region           = "us-central1"
  settings {
    tier              = var.server_tier
    availability_type = "REGIONAL" # "ZONAL" for single, "REGIONAL" for HA

    backup_configuration { # If not set, automatic backups are disabled
      enabled            = true
      binary_log_enabled = true
      start_time         = "05:00"
    }

    ip_configuration {
      ipv4_enabled    = true
      private_network = var.private_network #declared in variables file
      authorized_networks {
        name  = var.network_name[0]
        value = var.network_value[0] # declared in variables file
      }
    }
  }

  deletion_protection = false # Set to true to prevent accidental deletion
}

resource "google_sql_database" "example_db" {
  name     = var.db_name
  instance = google_sql_database_instance.example.name
}

resource "google_sql_user" "example_user" {
  name     = var.db_user_name
  instance = google_sql_database_instance.example.name
  password = var.db_user_password # ***Store in a secret management system***
}
