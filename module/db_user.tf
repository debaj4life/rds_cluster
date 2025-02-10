resource "null_resource" "create_users" {
  depends_on = [aws_rds_cluster.aurora_serverless, aws_rds_cluster_instance.aurora_instance]

  provisioner "local-exec" {
    command = <<EOT
      export PGPASSWORD=${var.db_master_password}
      mysql -h ${aws_rds_cluster.aurora_serverless.endpoint} -U ${var.db_master_username} -d ${var.database_name} <<EOF
        CREATE USER 'read_user'@'%' WITH PASSWORD 'TestRead000!';
        GRANT SELECT ON ${var.database_name} TO 'read_user'@'%';

        CREATE USER 'write_user'@'%' WITH PASSWORD 'TestWrite000!';
        GRANT ALL PRIVILEGES ON ${var.database_name} TO 'write_user'@'%';
      EOF
    EOT
  }
}