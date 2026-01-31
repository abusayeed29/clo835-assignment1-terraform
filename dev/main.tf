############################################
# Default VPC + pick a public subnet
############################################

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default_vpc_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# Load each subnet so we can filter public ones
data "aws_subnet" "subnet_details" {
  for_each = toset(data.aws_subnets.default_vpc_subnets.ids)
  id       = each.value
}

locals {
  public_subnet_ids = [
    for s in data.aws_subnet.subnet_details : s.id
    if s.map_public_ip_on_launch
  ]

  chosen_public_subnet_id = element(local.public_subnet_ids, 0)
}

############################################
# Modules
############################################

module "ecr" {
  source = "./modules/ecr"

  project_name = var.project_name
  repos        = ["webapp", "mysql"]
}

module "iam" {
  source = "./modules/iam"

  project_name = var.project_name
}

module "security_group" {
  source = "./modules/security-group"

  project_name = var.project_name
  vpc_id       = data.aws_vpc.default.id
  my_ip_cidr   = var.my_ip_cidr
  app_ports    = [8081, 8082, 8083]
}

module "ec2" {
  source = "./modules/ec2"

  project_name          = var.project_name
  instance_type         = var.instance_type
  key_name              = var.key_name
  subnet_id             = local.chosen_public_subnet_id
  security_group_id     = module.security_group.security_group_id
  instance_profile_name = module.iam.instance_profile_name
}
