locals {
  common_tags = {
    Project = var.project
    Owner   = var.owner
  }
}

# Create all SGs
resource "aws_security_group" "this" {
  for_each    = { for sg in var.security_groups : sg.name => sg }
  name        = each.value.name
  description = each.value.description
  vpc_id      = var.vpc_id

  tags = merge(local.common_tags, { Name = each.value.name })
}

# Flatten ingress rules
locals {
  ingress_rules = flatten([
    for sg in var.security_groups : [
      for rule in sg.ingress : {
        sg_name     = sg.name
        from_port   = rule.from_port
        to_port     = rule.to_port
        protocol    = rule.protocol
        cidr_blocks = try(rule.cidr_blocks, null)
        source_sg   = try(rule.source_sg, null)
      }
    ]
  ])

  egress_rules = flatten([
    for sg in var.security_groups : [
      for rule in sg.egress : {
        sg_name     = sg.name
        from_port   = rule.from_port
        to_port     = rule.to_port
        protocol    = rule.protocol
        cidr_blocks = try(rule.cidr_blocks, null)
        source_sg   = try(rule.source_sg, null)
      }
    ]
  ])
}

# Ingress rules
resource "aws_security_group_rule" "ingress" {
  for_each = {
    for idx, rule in local.ingress_rules : "${rule.sg_name}-${idx}" => rule
  }

  type              = "ingress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  security_group_id = aws_security_group.this[each.value.sg_name].id

  cidr_blocks = each.value.cidr_blocks

  source_security_group_id = (
    each.value.source_sg != null ?
    aws_security_group.this[each.value.source_sg].id :
    null
  )
} 

# Egress rules
resource "aws_security_group_rule" "egress" {
  for_each = {
    for idx, rule in local.egress_rules : "${rule.sg_name}-${idx}" => rule
  }

  type              = "egress"
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  security_group_id = aws_security_group.this[each.value.sg_name].id

  cidr_blocks = each.value.cidr_blocks

  source_security_group_id = (
    each.value.source_sg != null ?
    aws_security_group.this[each.value.source_sg].id :
    null
  )
}
