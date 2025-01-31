output "instance_connection_name" {
  value = google_sql_database_instance.example.connection_name
}

output "public_ip" {
  value = google_sql_database_instance.instance-example.ip_address
}
