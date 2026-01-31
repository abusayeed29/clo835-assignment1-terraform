output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = module.ec2.public_ip
}

output "ecr_app_url" {
  description = "ECR repository URL for app"
  value       = module.ecr.app_repo_url
}

output "ecr_mysql_url" {
  description = "ECR repository URL for mysql"
  value       = module.ecr.mysql_repo_url
}

output "aws_region" {
  value = var.aws_region
}
