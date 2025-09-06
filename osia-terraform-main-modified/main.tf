module "vpc" {
  source               = "./modules/vpc"
  vpc_name             = var.vpc_name
  vpc_cidr             = var.vpc_cidr
  azs                  = var.azs
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  project              = var.project
  owner                = var.owner
}


module "security_group" {
  source          = "./modules/security_group"
  vpc_id          = module.vpc.vpc_id
  security_groups = var.security_groups
  project         = var.project
  owner           = var.owner
}


module "ec2" {
  source            = "./modules/ec2"
  instances         = var.instances
  private_subnet_ids = module.vpc.private_subnet_ids
  security_groups   = module.security_group.security_groups
  key_name           = var.ec2_key_name
  project           = var.project
  owner             = var.owner
}

module "bastion" {
  source            = "./modules/bastion"
  name              = var.project
  ami               = var.bastion_ami
  instance_type     = var.bastion_instance_type
  key_name          = var.ec2_key_name      # reuse the same key
  subnet_id         = module.vpc.public_subnets[0]
  security_group_id = module.security_group.security_groups["bastion-sg"]
}



module "rds" {
  source              = "./modules/rds"
  cluster_identifier  = var.rds_cluster_identifier
  engine_version      = var.rds_engine_version
  database_name       = var.rds_database_name
  master_username     = var.rds_master_username
  master_password     = var.rds_master_password
  instance_class      = var.rds_instance_class
  subnet_ids          = module.vpc.private_subnet_ids
  vpc_id              = module.vpc.vpc_id
  security_group_ids  = [module.security_group.security_groups["db-sg"]]
  project             = var.project
  owner               = var.owner
  skip_final_snapshot      = var.rds_skip_final_snapshot
  final_snapshot_identifier = var.rds_final_snapshot_identifier
  
}


module "ecr" {
  source              = "./modules/ecr"
  name                = var.ecr_name
  image_tag_mutability = var.ecr_image_tag_mutability
  scan_on_push        = var.ecr_scan_on_push
  project             = var.project
  owner               = var.owner
}



module "beanstalk" {
  source               = "./modules/beanstalk"
  myelasticapp         = var.myelasticapp
  beanstalkappenv      = var.beanstalkappenv
  solution_stack_name  = var.solution_stack_name
  tier                 = var.tier
  vpc_id               = module.vpc.vpc_id
  public_subnets       = module.vpc.public_subnet_ids
  instance_type        = var.instance_type
  iam_instance_profile = var.iam_instance_profile
}