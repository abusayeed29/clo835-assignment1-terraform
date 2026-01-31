output "instance_profile_name" {
  description = "IAM instance profile name to attach to EC2"
  value       = aws_iam_instance_profile.ec2_profile.name
}
