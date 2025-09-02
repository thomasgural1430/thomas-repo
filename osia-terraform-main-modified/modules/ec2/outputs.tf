output "instance_public_ips" {
  value = { for k, inst in aws_instance.this : k => inst.public_ip }
}

output "instance_private_ips" {
  value = { for k, inst in aws_instance.this : k => inst.private_ip }
}