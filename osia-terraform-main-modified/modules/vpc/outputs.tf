output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.this.id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = aws_subnet.private[*].id
}

output "igw_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.this.id
}

output "public_route_table_id" {
  description = "The ID of the public route table"
  value       = aws_route_table.public.id
}

output "public_subnets" {
  description = "List of public subnet IDs"
  value       = aws_subnet.public[*].id
}

output "private_subnets" {
  description = "List of private subnet IDs"
  value       = aws_subnet.private[*].id
}


output "private_route_table_ids" {
  description = "The IDs of the private route tables"
  value       = aws_route_table.private[*].id
}


output "nat_gateway_id" {
  description = "The NAT Gateway ID"
  value       = aws_nat_gateway.this.id
}

output "nat_eip" {
  description = "The Elastic IP of NAT Gateway"
  value       = aws_eip.nat.public_ip
}