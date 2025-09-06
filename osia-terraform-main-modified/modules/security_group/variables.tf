variable "vpc_id" {
  description = "VPC ID where SGs will be created"
  type        = string
}

variable "security_groups" {
  description = <<EOT
List of security groups to create.
Each object should have:
- name        : SG name
- description : SG description
- ingress     : list of ingress rules
- egress      : list of egress rules
Ingress/Egress rule format:
{
  from_port  = number
  to_port    = number
  protocol   = string
  cidr_blocks = list(string)           # optional
  source_sg   = string (SG name)       # optional, must match another SG "name"
}
EOT

  type = list(object({
    name        = string
    description = string
    ingress = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = optional(list(string))
      source_sg   = optional(string)
    }))
    egress = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = optional(list(string))
      source_sg   = optional(string)
    }))
  }))
}

variable "project" {
  type        = string
  description = "Project tag"
}

variable "owner" {
  type        = string
  description = "Owner tag"
}


