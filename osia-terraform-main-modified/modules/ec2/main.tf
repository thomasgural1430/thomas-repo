resource "aws_instance" "this" {
  for_each = { for inst in var.instances : inst.name => inst }

  ami           = each.value.ami
  instance_type = each.value.instance_type
  subnet_id     = var.ec2_subnet_id

  vpc_security_group_ids = var.security_group_ids

  monitoring    = true
  ebs_optimized = true

  tags = {
    Name = each.value.name
  }
}
