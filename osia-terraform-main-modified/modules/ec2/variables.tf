variable "ec2_subnet_id" {
  description = "Subnet ID where EC2 instances will be launched"
  type        = string
}

variable "security_group_ids" {
  description = "List of Security Group IDs to attach to EC2 instances"
  type        = list(string)
}

variable "instances" {
  description = <<EOT
List of EC2 instances to create.
Each instance should have:
  - name
  - ami
  - instance_type
EOT
  type = list(object({
    name          = string
    ami           = string
    instance_type = string
  }))
}
