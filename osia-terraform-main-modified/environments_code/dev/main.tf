


### vpc

module "vpc" {
  source      = "../../modules/vpc"
  project     = var.project
  environment = var.environment
  region      = var.region
  vpc_cidr    = var.vpc_cidr

  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  tags            = var.tags
}





#### security group

module "securitygroup" {
  source = "../../modules/securitygroup"
  security_groups = var.security_groups
}

### ec2

module "ec2" {
  source             = "../../modules/ec2"
  ec2_subnet_id      = module.vpc.public_subnets[0]
  security_group_ids = [module.securitygroup.security_group_ids["osia_fe_securitygroup"]]
  instances          = var.instances
}




# RDS Module
module "rds" {
  source = "./modules/rds"

  db_identifier               = var.db_identifier
  db_allocated_storage        = var.db_allocated_storage
  db_engine                   = var.db_engine
  db_engine_version           = var.db_engine_version
  db_instance_class           = var.db_instance_class
  db_storage_encrypted        = var.db_storage_encrypted
  db_publicly_accessible      = var.db_publicly_accessible
  db_delete_automated_backups = var.db_delete_automated_backups
  db_skip_final_snapshot      = var.db_skip_final_snapshot
  db_name                     = var.db_name
  db_username                 = var.db_username
  db_password                 = var.db_password
  db_apply_immediately        = var.db_apply_immediately
  db_multi_az                 = var.db_multi_az

  # Pull in from other modules
  db_subnet_group_name = module.vpc.db_subnet_group_name
  security_group_ids   = [module.sg.osia_rds_securitygroup]
}



### ECR

module "ecr" {
  source = "./modules/ecr"

  repositories         = var.ecr_repositories
  scan_on_push         = var.ecr_scan_on_push
  image_tag_mutability = var.ecr_image_tag_mutability
}




##beanstalk
module "beanstalk" {
  source = "./modules/beanstalk"

  app_name             = var.app_name
  app_description      = var.app_description
  env_name             = var.env_name
  solution_stack_name  = var.solution_stack_name
  tier                 = var.tier

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnets

  iam_instance_profile = var.iam_instance_profile
  associate_public_ip  = var.associate_public_ip
  loadbalancer_type    = var.loadbalancer_type
  elb_scheme           = var.elb_scheme

  min_size       = var.min_size
  max_size       = var.max_size
  instance_type  = var.instance_type
  health_reporting = var.health_reporting
  http_matcher   = var.http_matcher
}
