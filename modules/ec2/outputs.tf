output "public_ip" {
  description = "EC2 public IP"
  value       = aws_instance.this.public_ip
}

output "public_dns" {
  description = "EC2 public DNS"
  value       = aws_instance.this.public_dns
}
