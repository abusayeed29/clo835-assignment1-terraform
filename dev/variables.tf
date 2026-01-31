variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "ami_id" {
  description = "Amazon Linux AMI ID"
  type        = string
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
}

variable "ssh_cidr" {
  description = "CIDR allowed for SSH (recommend your IP /32)"
  type        = string
  default     = "0.0.0.0/0"
}
