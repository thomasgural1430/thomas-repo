variable "app_name" {
  type = string
}

variable "app_description" {
  type = string
  default = "Osia web application"
}

variable "env_name" {
  type = string
}

variable "solution_stack_name" {
  type = string
}

variable "tier" {
  type    = string
  default = "WebServer"
}

variable "vpc_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "iam_instance_profile" {
  type = string
  default = "aws-elasticbeanstalk-ec2-role"
}

variable "associate_public_ip" {
  type    = string
  default = "True"
}

variable "loadbalancer_type" {
  type    = string
  default = "application"
}

variable "elb_scheme" {
  type    = string
  default = "internet facing"
}

variable "min_size" {
  type    = number
  default = 1
}

variable "max_size" {
  type    = number
  default = 2
}

variable "instance_type" {
  type    = string
  default = "t2.medium"
}

variable "health_reporting" {
  type    = string
  default = "enhanced"
}

variable "http_matcher" {
  type    = string
  default = "200"
}
