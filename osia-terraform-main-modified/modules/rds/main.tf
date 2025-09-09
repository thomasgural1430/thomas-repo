resource "aws_db_subnet_group" "this" {
  name       = "${var.cluster_identifier}-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Project = var.project
    Owner   = var.owner
  }
}

resource "aws_rds_cluster" "this" {
  cluster_identifier      = var.cluster_identifier
  engine                  = var.engine
  engine_version          = var.engine_version
  database_name           = var.database_name
  master_username         = var.master_username
  master_password         = var.master_password
  db_subnet_group_name    = aws_db_subnet_group.this.name
  vpc_security_group_ids  = var.security_group_ids
  skip_final_snapshot      = var.skip_final_snapshot
  final_snapshot_identifier = var.final_snapshot_identifier
  tags = {
    Project = var.project
    Owner   = var.owner
  }
}


resource "aws_rds_cluster_instance" "writer" {
  identifier         = "${var.cluster_identifier}-writer"
  cluster_identifier = aws_rds_cluster.this.id
  instance_class     = var.instance_class
  engine             = var.engine
  engine_version     = var.engine_version
  publicly_accessible = false
  db_subnet_group_name = aws_db_subnet_group.this.name
}


resource "aws_rds_cluster_instance" "reader" {
  count              = var.create_reader ? var.reader_count : 0
  identifier         = "${var.cluster_identifier}-reader"
  cluster_identifier = aws_rds_cluster.this.id
  instance_class     = var.instance_class
  engine             = var.engine
  engine_version     = var.engine_version
  publicly_accessible = false
  db_subnet_group_name = aws_db_subnet_group.this.name
}
