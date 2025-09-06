variable "key_name" {
  description = "EC2 key pair name for Bastion host"
  type        = string
}
variable "ami" {
  description = "AMI ID for bastion host"
  type        = string
}
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}
variable "subnet_id" {
  description = "Public subnet ID for bastion"
  type        = string
}
variable "security_group_id" {
  description = "Security group ID for bastion"
  type        = string
}
variable "name" {
  description = "Name prefix for tagging"
  type        = string
}
