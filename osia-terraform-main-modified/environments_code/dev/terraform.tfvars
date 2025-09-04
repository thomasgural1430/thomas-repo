
##VPC Variables

project     = "osia"
environment = "dev"
region      = "eu-central-1"
vpc_cidr    = "10.0.0.0/16"

public_subnets = [
  { cidr = "10.0.0.0/26",  az = "eu-central-1a" },
  { cidr = "10.0.0.64/26", az = "eu-central-1b" }
]

private_subnets = [
  { cidr = "10.0.0.128/26", az = "eu-central-1b" },
  { cidr = "10.0.0.192/26", az = "eu-central-1c" }
]

tags = {
  Environment = "dev"
  Owner       = "Thomas"
  Project     = "osia"
}


### Security Groups Variables


# Security Group Variables
fe_sg_name  = "osia_fe_securitygroup"
rds_sg_name = "osia_rds_securitygroup"

fe_ingress_rules = [
  { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
  { from_port = 80, to_port = 80, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
  { from_port = 443, to_port = 443, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }
]

rds_ingress_rules = [
  { from_port = 3306, to_port = 3306, protocol = "tcp", security_groups = [] } # we'll override with FE SG in main.tf
]



####EC2 Variables

instances = [
  {
    name          = "osia_ec2_be1"
    ami           = "ami-05dd26907b8fa3fb5"
    instance_type = "t3.large"
  },
  {
    name          = "osia_ec2_be2"
    ami           = "ami-05dd26907b8fa3fb5"
    instance_type = "t3.medium"
  }
]




#### security groups

security_groups = [
  {
    name        = "osia_fe_securitygroup"
    description = "Frontend SG"
    vpc_id      = "vpc-12345678"
    ingress = [
      { from_port = 22,  to_port = 22,  protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
      { from_port = 80,  to_port = 80,  protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] },
      { from_port = 443, to_port = 443, protocol = "tcp", cidr_blocks = ["0.0.0.0/0"] }
    ]
    egress = [
      { from_port = 0, to_port = 0, protocol = "-1", cidr_blocks = ["0.0.0.0/0"] }
    ]
  },
  {
    name        = "osia_rds_securitygroup"
    description = "RDS SG"
    vpc_id      = "vpc-12345678"
    ingress = [
      {
        from_port       = 3306
        to_port         = 3306
        protocol        = "tcp"
        security_groups = ["${module.securitygroup.security_group_ids["osia_fe_securitygroup"]}"]
      }
    ]
    egress = [
      { from_port = 0, to_port = 0, protocol = "-1", cidr_blocks = ["0.0.0.0/0"] }
    ]
  }
]




###RDS Variables

# RDS
db_identifier               = "osiadb1"
db_allocated_storage        = 20
db_engine                   = "postgres"
db_engine_version           = "15.12"
db_instance_class           = "db.t3.micro"
db_storage_encrypted        = false
db_publicly_accessible      = true
db_delete_automated_backups = true
db_skip_final_snapshot      = true
db_name                     = "osia_db1"
db_username                 = "osia_db_admin"
db_password                 = "SuperSecretPass123!"
db_apply_immediately        = true
db_multi_az                 = false




###ECR Variables

# ECR
ecr_repositories         = ["osia-ecr-fe", "osia-ecr-be"]
ecr_scan_on_push         = true
ecr_image_tag_mutability = "MUTABLE"




###beanstalk

app_name        = "OsiaWebApp"
app_description = "Osia Elastic Beanstalk App"
env_name        = "osia-env1"

solution_stack_name = "64bit Amazon Linux 2023 v6.6.1 running Node.js 22"
tier                = "WebServer"

iam_instance_profile = "aws-elasticbeanstalk-ec2-role"
associate_public_ip  = "True"
loadbalancer_type    = "application"
elb_scheme           = "internet facing"

min_size      = 1
max_size      = 3
instance_type = "t3.medium"

health_reporting = "enhanced"
http_matcher     = "200"
