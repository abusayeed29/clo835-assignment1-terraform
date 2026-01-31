variable "project_name" {
  type        = string
  description = "Project name for naming/tags"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID (default VPC)"
}

variable "my_ip_cidr" {
  type        = string
  description = "Your public IP in CIDR for SSH access"
}

variable "app_ports" {
  type        = list(number)
  description = "Public application ports to open"
  default     = [8081, 8082, 8083]
}
