resource "aws_rds_cluster" "aurora_serverless" {
  cluster_identifier      = var.db_cluster_identifier
  engine                  = var.engine
  engine_mode             = var.engine_mode
  master_username         = var.db_master_username
  master_password         = var.db_master_password
  skip_final_snapshot     = true
  database_name           = var.database_name
  backup_retention_period = 7
}

resource "aws_rds_cluster_instance" "aurora_instance" {
  cluster_identifier = aws_rds_cluster.aurora_serverless.id
  instance_class     = var.instance_class  
  engine             = var.engine
  publicly_accessible = false  
}

resource "aws_secretsmanager_secret" "db_secret" {
  name = "aurora-db-credentials"
}

resource "aws_secretsmanager_secret_version" "db_secret_version" {
  secret_id     = aws_secretsmanager_secret.db_secret.id
  secret_string = jsonencode({
    username = var.db_master_username  
    password = var.db_master_password  
  })
  
}



