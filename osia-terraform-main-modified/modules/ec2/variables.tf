variable "instances" {
  description = "List of EC2 instances to create"
  type = list(object({
    name           = string
    ami_id         = string
    instance_type  = string
    subnet_index   = number # which private subnet to place the instance in
  }))
}

variable "private_subnet_ids" {
  description = "Private subnet IDs from VPC module"
  type        = list(string)
}

variable "security_groups" {
  description = "Map of security group IDs from SG module"
  type        = map(string)
}

variable "project" {
  type = string
}

variable "owner" {
  type = string
}


variable "key_name" {
  description = "SSH key pair name for EC2 login"
  type        = string
}