variable "project_name" {
  type        = string
  description = "Project name for naming/tags"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}

variable "key_name" {
  type        = string
  description = "Existing EC2 key pair name"
}

variable "subnet_id" {
  type        = string
  description = "Public subnet ID (default VPC)"
}

variable "security_group_id" {
  type        = string
  description = "Security group ID for EC2"
}

variable "instance_profile_name" {
  type        = string
  description = "IAM instance profile name"
}
