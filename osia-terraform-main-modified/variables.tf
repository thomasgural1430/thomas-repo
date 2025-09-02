##############################
# Global / Common
##############################

variable "project" {
  description = "Project name for tagging and resource identification"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g., dev, uat, prod)"
  type        = string
}

variable "region" {
  description = "AWS region to deploy resources into"
  type        = string
}

variable "tags" {
  description = "A map of tags to apply to all resources"
  type        = map(string)
  default     = {}
}

##############################
# VPC
##############################

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets" {
  description = "Public subnet definitions"
  type = list(object({
    cidr       = string
    az         = string
  }))
}

variable "private_subnets" {
  description = "Private subnet definitions"
  type = list(object({
    cidr       = string
    az         = string
  }))
}


##############################
# Security Groups
##############################

variable "security_groups" {
  description = "List of security groups with ingress and egress rules"
  type = list(object({
    name        = string
    description = string
    vpc_id      = string
    ingress = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
    egress = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = list(string)
    }))
  }))
}




##############################
# EC2
##############################

variable "instances" {
  description = "List of EC2 instance configurations (name, ami, instance_type, etc.)"
  type        = list(object({
    name          = string
    ami           = string
    instance_type = string
    key_name      = string
    volume_size   = number
    tags          = map(string)
  }))
}

##############################
# RDS
##############################



variable "db_identifier" {
  description = "RDS instance identifier"
  type        = string
}

variable "db_allocated_storage" {
  description = "Allocated storage in GB"
  type        = number
}

variable "db_engine" {
  description = "Database engine (e.g., mysql, postgres)"
  type        = string
}

variable "db_engine_version" {
  description = "Version of the database engine"
  type        = string
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
}

variable "db_storage_encrypted" {
  description = "Whether storage is encrypted"
  type        = bool
}

variable "db_publicly_accessible" {
  description = "Whether the DB is publicly accessible"
  type        = bool
}

variable "db_delete_automated_backups" {
  description = "Whether automated backups should be deleted"
  type        = bool
}

variable "db_skip_final_snapshot" {
  description = "Whether to skip final snapshot on DB deletion"
  type        = bool
}

variable "db_name" {
  description = "Initial database name"
  type        = string
}

variable "db_username" {
  description = "Master username for DB"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Master password for DB"
  type        = string
  sensitive   = true
}

variable "db_apply_immediately" {
  description = "Whether changes should be applied immediately"
  type        = bool
}

variable "db_multi_az" {
  description = "Enable multi-AZ deployment"
  type        = bool
}

##############################
# ECR
##############################

variable "ecr_repositories" {
  description = "List of ECR repository names"
  type        = list(string)
}

variable "ecr_scan_on_push" {
  description = "Whether to enable scan on push for ECR repos"
  type        = bool
  default     = true
}

variable "ecr_image_tag_mutability" {
  description = "Image tag mutability (MUTABLE or IMMUTABLE)"
  type        = string
  default     = "MUTABLE"
}

##############################
# Elastic Beanstalk
##############################

variable "app_name" {
  description = "Elastic Beanstalk application name"
  type        = string
}

variable "app_description" {
  description = "Elastic Beanstalk application description"
  type        = string
}

variable "env_name" {
  description = "Elastic Beanstalk environment name"
  type        = string
}

variable "solution_stack_name" {
  description = "Elastic Beanstalk solution stack (e.g., Node.js, Python)"
  type        = string
}

variable "tier" {
  description = "Elastic Beanstalk environment tier (WebServer or Worker)"
  type        = string
}

variable "iam_instance_profile" {
  description = "IAM instance profile for Elastic Beanstalk EC2 instances"
  type        = string
}

variable "associate_public_ip" {
  description = "Associate public IP to instances in Elastic Beanstalk"
  type        = bool
}

variable "loadbalancer_type" {
  description = "Load balancer type (application or classic)"
  type        = string
}

variable "elb_scheme" {
  description = "ELB scheme (internet facing or internal)"
  type        = string
}

variable "min_size" {
  description = "Minimum number of instances"
  type        = number
}

variable "max_size" {
  description = "Maximum number of instances"
  type        = number
}

variable "instance_type" {
  description = "EC2 instance type for Elastic Beanstalk environment"
  type        = string
}

variable "health_reporting" {
  description = "Health reporting system type (basic or enhanced)"
  type        = string
}

variable "http_matcher" {
  description = "HTTP matcher code (e.g., 200)"
  type        = string
}
