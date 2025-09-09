#VPC

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "vpc_name" {
  description = "VPC name"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
}

variable "azs" {
  description = "Availability Zones"
  type        = list(string)
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDRs"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "Private subnet CIDRs"
  type        = list(string)
}

variable "project" {
  description = "Project name for tagging"
  type        = string
}

variable "owner" {
  description = "Owner of the resources"
  type        = string
}



# Security groups (dynamic objects)
variable "security_groups" {
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



variable "instances" {
  description = "EC2 instance configs"
  type = list(object({
    name           = string
    ami_id         = string
    instance_type  = string
    subnet_index   = number
  }))
}

variable "ec2_key_name" {
  description = "Key pair name to use for EC2 instances"
  type        = string
}



variable "rds_cluster_identifier" {
  type = string
}
variable "rds_engine_version" {
  type = string
}
variable "rds_database_name" {
  type = string
}
variable "rds_master_username" {
  type = string
}
variable "rds_master_password" {
  type      = string
  sensitive = true
}
variable "rds_instance_class" {
  type = string
}


variable "rds_skip_final_snapshot" {
  type        = bool
  default     = true
}

variable "rds_final_snapshot_identifier" {
  type    = string
  default = null
}


# Reader configuration
variable "create_reader" {
  description = "Whether to create a reader instance"
  type        = bool
  default     = false
}

variable "reader_count" {
  description = "Number of reader instances to create (if enabled)"
  type        = number
  default     = 1
}

variable "ecr_name" {
  description = "ECR repository name"
  type        = string
}

variable "ecr_image_tag_mutability" {
  description = "Tag mutability (MUTABLE or IMMUTABLE)"
  type        = string
  default     = "IMMUTABLE"
}

variable "ecr_scan_on_push" {
  description = "Enable scan on push"
  type        = bool
  default     = true
}


variable "bastion_ami" {
  description = "AMI ID for bastion host"
  type        = string
}

variable "bastion_instance_type" {
  description = "Instance type for bastion host"
  type        = string
  default     = "t3.micro"
}


# Beanstalk Variables
variable "myelasticapp" {
  description = "Elastic Beanstalk application name"
  type        = string
}

variable "beanstalkappenv" {
  description = "Elastic Beanstalk environment name"
  type        = string
}

variable "solution_stack_name" {
  description = "Elastic Beanstalk solution stack name"
  type        = string
}

variable "tier" {
  description = "Elastic Beanstalk environment tier (WebServer or Worker)"
  type        = string
  default     = "WebServer"
}

variable "instance_type" {
  description = "EC2 instance type for Beanstalk environment"
  type        = string
  default     = "t2.medium"
}

variable "iam_instance_profile" {
  description = "IAM Instance profile for Beanstalk EC2 instances"
  type        = string
  default     = "aws-elasticbeanstalk-ec2-role"
}