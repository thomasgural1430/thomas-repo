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

variable "vpc_id" {
  description = "VPC ID where Beanstalk environment will be launched"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet IDs for Beanstalk environment"
  type        = list(string)
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
