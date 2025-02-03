variable "instance_name" {
  description = "Name of the instance"
  type        = string
  default     = "instance-example"
}

variable "instance_type" {
  description = "Type of the instance"
  type        = string
  default     = "e2-micro"
}

variable "instance_zone" {
  description = "Zone of the instance"
  type        = string
  default     = "us-central1-a"
}

variable "disk_image" {
  description = "Disk image to use for the instance"
  type        = string
  default     = "debian-cloud/debian-9"
}

variable "disk_size" {
  description = "Size of the boot disk in GB"
  type        = number
  default     = 50 # Disk size in GB
}

variable "disk_type" {
  description = "Type of the boot disk"
  type        = string
  default     = "pd-standard" # Options: "pd-ssd", "pd-balanced" ..etc
}

variable "network_name" {
  description = "Name of the network"
  type        = string
  default     = "default"
}