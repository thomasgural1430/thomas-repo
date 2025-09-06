aws_region = "ap-south-1"

vpc_name = "osiav1-vpc"
vpc_cidr = "10.0.0.0/16"

azs = ["ap-south-1a", "ap-south-1b"]

public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]

project = "osiav1"
owner   = "Random"




security_groups = [
  {
    name        = "web-sg"
    description = "Allow web traffic"
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
    name        = "db-sg"
    description = "Allow MySQL only from web SG"
    ingress = [
      { from_port = 3306, to_port = 3306, protocol = "tcp", source_sg = "web-sg" },
      { from_port = 3306, to_port = 3306, protocol = "tcp", source_sg = "private-ec2-sg" }
    ]
    egress = [
      { from_port = 0, to_port = 0, protocol = "-1", cidr_blocks = ["0.0.0.0/0"] }
    ]
  },
  {
    name        = "bastion-sg"
    description = "Allow SSH from my public IP"
    ingress = [
      {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["103.135.62.208/32"] # replace with your IP
      }
    ]
    egress = [
      {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  },
  {
    name        = "private-ec2-sg"
    description = "Allow all traffic from DB SG"
    ingress = [
      { from_port = 0, to_port = 0, protocol = "-1", source_sg = "db-sg" },
      { from_port = 22, to_port = 22, protocol = "tcp", source_sg = "bastion-sg" }
    ]
    egress = [
      { from_port = 0, to_port = 0, protocol = "-1", cidr_blocks = ["0.0.0.0/0"] }
    ]
  }
]




# EC2 private Instances (1 in each private subnet)
instances = [
  { name = "osiav1-ec2-1", ami_id = "ami-02d26659fd82cf299", instance_type = "t3.micro", subnet_index = 0 },
  { name = "osiav1-ec2-2", ami_id = "ami-02d26659fd82cf299", instance_type = "t3.micro", subnet_index = 1 }
]
ec2_key_name = "osiav1-key"

##bastion

bastion_ami           = "ami-02d26659fd82cf299" # Example Amazon Linux 2 (ap-south-1)
bastion_instance_type = "t3.micro"



ecr_name                 = "osiav1-app-repo"
ecr_image_tag_mutability = "IMMUTABLE"
ecr_scan_on_push         = true


##RDS

rds_cluster_identifier = "osiav1-aurora-cluster"
rds_engine_version     = "15.3"
rds_database_name      = "osiav1db"
rds_master_username    = "adminuser"
rds_master_password    = "SuperSecretPass123"
rds_instance_class     = "db.r6g.large"
rds_skip_final_snapshot = true



# Beanstalk
myelasticapp         = "osiav1-eb-app"
beanstalkappenv      = "osiav1-eb-env"
solution_stack_name  = "64bit Amazon Linux 2 v3.9.4 running Corretto 17"
tier                 = "WebServer"
instance_type        = "t2.medium"
