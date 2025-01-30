variable "private_network" {
  description = "string"
  default = "projects/my-project/global/networks/default" 
}

variable "network_name" {
  description = "list of authorized network names"
  default = ["my-network"]
}
variable "network_value" {
  description = "list of authorized network values(IP ranges)"
  default = ["203.0.113.0/24"]  # Replace with actual IP range(s)
}