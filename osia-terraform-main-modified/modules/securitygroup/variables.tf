variable "security_groups" {
  description = "List of security groups with rules"
  type = list(object({
    name        = string
    description = string
    vpc_id      = string
    ingress = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = optional(list(string), [])
      security_groups = optional(list(string), [])
    }))
    egress = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = optional(list(string), [])
      security_groups = optional(list(string), [])
    }))
    tags = optional(map(string), {})
  }))
}
