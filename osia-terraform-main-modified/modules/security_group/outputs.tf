output "security_group_ids" {
  description = "Map of SG names to IDs"
  value       = { for name, sg in aws_security_group.this : name => sg.id }
}


output "security_groups" {
  description = "Map of security group IDs by name"
  value = {
    for sg_name, sg in aws_security_group.this :
    sg_name => sg.id
  }
}