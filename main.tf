# Existing AWS Learner Lab instance profile
data "aws_iam_instance_profile" "labrole" {
  name = "LabInstanceProfile"
}

# -------------------------
# Networking: default VPC + choose a safe subnet
# -------------------------
data "aws_vpc" "default" {
  default = true
}

# Get all subnets in the default VPC
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# Pull details for each subnet so we can read availability_zone
data "aws_subnet" "details" {
  for_each = toset(data.aws_subnets.default.ids)
  id       = each.value
}

locals {
  # These AZs usually support common instance types (avoids us-east-1e)
  allowed_azs = ["us-east-1a", "us-east-1b", "us-east-1d", "us-east-1f"]

  candidate_subnets = [
    for s in data.aws_subnet.details :
    s.id if contains(local.allowed_azs, s.availability_zone)
  ]

  # If you manually set var.subnet_id, it will use that.
  # Otherwise it picks the first subnet from the allowed AZ list.
  chosen_subnet_id = coalesce(var.subnet_id, local.candidate_subnets[0])
}

# -------------------------
# Modules
# -------------------------

module "ecr" {
  source = "./modules/ecr"

  app_repo_name   = var.app_repo_name
  mysql_repo_name = var.mysql_repo_name
}

module "security_group" {
  source = "./modules/security-group"

  sg_name        = var.sg_name
  sg_description = "Allow SSH and App traffic"
  ssh_cidr       = var.ssh_cidr
  app_cidr       = var.app_cidr
}

module "ec2" {
  source = "./modules/ec2"

  ami_id               = var.ami_id
  instance_type        = var.instance_type
  key_name             = var.key_name
  subnet_id            = local.chosen_subnet_id
  security_group_id    = module.security_group.security_group_id
  iam_instance_profile = data.aws_iam_instance_profile.labrole.name
  instance_name        = "clo-app"
}