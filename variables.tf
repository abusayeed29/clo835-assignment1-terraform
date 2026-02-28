variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "ami_id" {
  type        = string
  description = "AMI ID"
}

variable "key_name" {
  type        = string
  description = "EC2 key pair name"
}

variable "instance_type" {
  type    = string
  default = "t3.medium"
}

# Optional: if you don’t set it, we will auto-pick a default subnet
variable "subnet_id" {
  type        = string
  description = "Subnet ID (optional)"
  default     = null
}

variable "app_repo_name" {
  type    = string
  default = "clo835-app"
}

variable "mysql_repo_name" {
  type    = string
  default = "clo835-mysql"
}

variable "sg_name" {
  type    = string
  default = "clo835-app-sg"
}

variable "ssh_cidr" {
  type    = string
  default = "0.0.0.0/0"
}

variable "app_cidr" {
  type    = string
  default = "0.0.0.0/0"
}