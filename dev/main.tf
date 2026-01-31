terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Existing AWS Learner Lab instance profile
data "aws_iam_instance_profile" "labrole" {
  name = "LabInstanceProfile"
}

# -------------------------
# Modules
# -------------------------

module "ecr" {
  source = "./modules/ecr"

  app_repo_name   = "clo835-app"
  mysql_repo_name = "clo835-mysql"
}

module "security_group" {
  source = "./modules/security-group"

  sg_name        = "clo835-app-sg"
  sg_description = "Allow SSH and App traffic"

  ssh_cidr = var.ssh_cidr
}

module "ec2" {
  source = "./modules/ec2"

  ami_id               = var.ami_id
  instance_type        = "t2.micro"
  key_name             = var.key_name
  security_group_id    = module.security_group.sg_id
  iam_instance_profile = data.aws_iam_instance_profile.labrole.name

  instance_name = "clo-app"
}
