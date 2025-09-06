resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "this" {
  key_name   = "${var.project}-key"
  public_key = tls_private_key.this.public_key_openssh
}


resource "local_file" "private_key" {
  content  = tls_private_key.this.private_key_pem
  filename = "${path.module}/ec2_private_key.pem"
}



resource "aws_instance" "this" {
  for_each = {
    for idx, cfg in var.instances :
    "${cfg.name}-${idx}" => cfg
  }

  ami           = each.value.ami_id
  instance_type = each.value.instance_type
  subnet_id     = element(var.private_subnet_ids, each.value.subnet_index)
  key_name = aws_key_pair.this.key_name
  vpc_security_group_ids = [
    var.security_groups["private-ec2-sg"]
  ]

  tags = {
    Name    = each.value.name
    Project = var.project
    Owner   = var.owner
  }
}
