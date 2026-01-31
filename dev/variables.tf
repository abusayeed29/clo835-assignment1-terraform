terraform {
  required_version = ">= 1.4.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

variable "project_name" {
  type        = string
  description = "Project name prefix for tagging/naming"
  default     = "clo835-assignment1"
}

variable "my_ip_cidr" {
  type        = string
  description = "Your public IP in CIDR format for SSH access (example: 1.2.3.4/32)"
}

variable "key_name" {
  type        = string
  description = "Existing EC2 key pair name (create in AWS Console first)"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t3.micro"
}

provider "aws" {
  region = var.aws_region
}
