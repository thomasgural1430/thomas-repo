# VPC
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "igw_id" {
  value = module.vpc.igw_id
}

output "public_route_table_id" {
  value = module.vpc.public_route_table_id
}




#SGs

output "security_groups" {
  value = module.security_group.security_group_ids
}


output "ec2_instance_ids" {
  description = "List of EC2 instance IDs"
  value       = module.ec2.instance_ids
}

output "ec2_private_ips" {
  description = "List of private IPs of EC2 instances"
  value       = module.ec2.private_ips
}

# RDS Outputs
output "rds_cluster_endpoint" {
  description = "Writer endpoint of the Aurora cluster"
  value       = module.rds.cluster_endpoint
}

output "rds_reader_endpoint" {
  description = "Reader endpoint of the Aurora cluster"
  value       = module.rds.reader_endpoint
}




##bastion
output "bastion_id" {
  description = "The ID of the Bastion EC2 instance"
  value       = module.bastion.id
}

output "bastion_private_ip" {
  description = "The private IP of the Bastion EC2 instance"
  value       = module.bastion.private_ip
}

output "bastion_public_ip" {
  description = "The public IP of the Bastion EC2 instance"
  value       = module.bastion.public_ip
}

output "bastion_key_name" {
  description = "The EC2 key pair name used by the Bastion"
  value       = module.bastion.key_name
}
