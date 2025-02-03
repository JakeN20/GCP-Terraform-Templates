variable "project_id" {
  description = "GCP Project ID"
  type        = string
  default     = "my-project-id"
}

variable "region" {
  description = "Region for the VPC"
  type        = string
  default     = "us-central1"
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "custom-vpc"
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
  default     = "subnet-1"
}

variable "subnet_name_2" {
  description = "Name of the subnet"
  type        = string
  default     = "subnet-2"

}
