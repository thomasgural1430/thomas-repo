output "instance_ids" {
  description = "IDs of EC2 instances"
  value       = [for i in aws_instance.this : i.id]
}

output "private_ips" {
  description = "Private IPs of EC2 instances"
  value       = [for i in aws_instance.this : i.private_ip]
}
