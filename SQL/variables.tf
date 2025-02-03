variable "private_network" {
  description = "name of private network"
  type        = string
  default     = "projects/my-project/global/networks/default"
}

variable "network_name" {
  description = "list of authorized network names"
  default     = ["my-network"]
}
variable "network_value" {
  description = "list of authorized network values(IP ranges)"
  default     = ["203.0.113.0/24"] # Replace with actual IP range(s)
}

variable "sql_server_name" {
  description = "sql server name"
  type        = string
  default     = "my-sql-instance"
}

variable "server_tier" {
  description = "sql server tier"
  type        = string
  default     = "db-f1-micro"
}

variable "db_name" {
  description = "database name"
  type        = string
  default     = "my-database"
}
