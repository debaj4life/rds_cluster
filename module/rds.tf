resource "aws_rds_cluster" "aurora_serverless" {
  cluster_identifier      = var.db_cluster_identifier
  engine                  = var.engine
  engine_mode             = var.engine_mode
  master_username         = var.db_master_username
  master_password         = var.db_master_password
  skip_final_snapshot     = true
  database_name           = "opencorporatedb"
  backup_retention_period = 7
}

resource "aws_rds_cluster_instance" "aurora_instance" {
  cluster_identifier = aws_rds_cluster.aurora_serverless.id
  instance_class     = var.instance_class  
  engine             = var.engine
  publicly_accessible = false  
}

resource "aws_secretsmanager_secret" "db_password_read" {
  name = "db_password_read_v2"
}

resource "aws_secretsmanager_secret_version" "db_password_read_version" {
  secret_id     = aws_secretsmanager_secret.db_password_read.id
  secret_string = jsonencode({
    username = var.db_username_read
    password = var.db_password_read
  })
}

resource "aws_secretsmanager_secret" "db_password_write" {
  name = "db_password_write_v2"
}

resource "aws_secretsmanager_secret_version" "db_password_write_version" {
  secret_id     = aws_secretsmanager_secret.db_password_write.id
  secret_string = jsonencode({
    username = var.db_username_write
    password = var.db_password_write
  })
}


resource "aws_secretsmanager_secret" "db_master_password" {
  name = "db_master_password"  # Name of the secret
}

resource "aws_secretsmanager_secret_version" "db_master_password_version" {
  secret_id     = aws_secretsmanager_secret.db_master_password.id
  secret_string = jsonencode({
    password = var.db_master_password  # Referencing the password variable
  })
}