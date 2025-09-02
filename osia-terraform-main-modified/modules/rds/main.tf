resource "aws_db_parameter_group" "spaceship_db_custom_pg" {
  name        = "custom-pg-${terraform.workspace}"
  family      = "postgres15"
  description = "Custom parameter group for autovacuum settings"

  parameter {
    name  = "autovacuum"
    value = "on"
  }

  parameter {
    name  = "autovacuum_vacuum_scale_factor"
    value = "0.2"
  }

  parameter {
    name  = "autovacuum_vacuum_threshold"
    value = "5000"
  }

  parameter {
    name  = "autovacuum_analyze_scale_factor"
    value = "0.1"
  }

  parameter {
    name  = "autovacuum_analyze_threshold"
    value = "10000"
  }
}

resource "aws_db_instance" "osiadb1" {
  identifier               = var.db_identifier
  allocated_storage        = var.db_allocated_storage
  engine                   = var.db_engine
  engine_version           = var.db_engine_version
  instance_class           = var.db_instance_class
  storage_encrypted        = var.db_storage_encrypted
  publicly_accessible      = var.db_publicly_accessible
  delete_automated_backups = var.db_delete_automated_backups
  skip_final_snapshot      = var.db_skip_final_snapshot
  db_name                  = var.db_name
  username                 = var.db_username
  password                 = var.db_password
  apply_immediately        = var.db_apply_immediately
  multi_az                 = var.db_multi_az

  # Use subnet group from VPC module
  db_subnet_group_name     = var.db_subnet_group_name

  vpc_security_group_ids   = var.security_group_ids

  parameter_group_name     = aws_db_parameter_group.spaceship_db_custom_pg.name

  tags = {
    Name = terraform.workspace
  }
}
