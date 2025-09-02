output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnets" {
  value = [for s in aws_subnet.public : s.id]
}

output "private_subnets" {
  value = [for s in aws_subnet.private : s.id]
}

output "db_subnet_group" {
  value = aws_db_subnet_group.this.name
}

output "igw_id" {
  value = aws_internet_gateway.this.id
}


