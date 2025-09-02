variable "vpc_cidr" {
  type = string 
}

variable "environment" {
  type = string
}

variable "region" {
  type = string
}

variable "ec2_t3medium" {
  type = string 
}

variable "ec2_ami" {
  type = string 
}



#######VPC#########

variable "project" {
  type        = string
  description = "Project name/prefix"
}

variable "environment" {
  type        = string
  description = "Environment name (e.g., dev, staging, prod)"
}

variable "region" {
  type        = string
  description = "AWS region"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnets" {
  type = list(object({
    cidr = string
    az   = string
  }))
}

variable "private_subnets" {
  type = list(object({
    cidr = string
    az   = string
  }))
}

variable "tags" {
  type        = map(string)
  description = "Common tags for all resources"
}



######EC2#############


variable "project" {
  type        = string
  description = "Project name/prefix"
}

variable "instances" {
  type = list(object({
    name               = string
    ami                = string
    instance_type      = string
    subnet_id          = string
    security_group_ids = list(string)
    monitoring         = optional(bool)
    ebs_optimized      = optional(bool)
  }))
  description = "List of EC2 instance configurations"
}

variable "tags" {
  type        = map(string)
  description = "Common tags for all resources"
}



###ECR

variable "ecr_repositories" {
  type        = list(string)
  description = "ECR repositories to create"
}

variable "ecr_scan_on_push" {
  type        = bool
  description = "Enable image scanning on push"
}

variable "ecr_image_tag_mutability" {
  type        = string
  description = "Image tag mutability (MUTABLE or IMMUTABLE)"
}


