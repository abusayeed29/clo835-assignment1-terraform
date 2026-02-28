output "ec2_public_ip" {
  value       = module.ec2.public_ip
  description = "Public IP of EC2"
}

output "security_group_id" {
  value       = module.security_group.security_group_id
  description = "Security group ID"
}

output "ecr_app_url" {
  value       = module.ecr.app_repo_url
  description = "ECR app repository URL"
}

output "ecr_mysql_url" {
  value       = module.ecr.mysql_repo_url
  description = "ECR mysql repository URL"
}

output "aws_region" {
  value       = var.aws_region
  description = "AWS region"
}