output "db_cluster_endpoint" {
  value = aws_rds_cluster.aurora_serverless.endpoint
  description = "The endpoint for the Aurora DB cluster"
}

output "db_cluster_id" {
  value = aws_rds_cluster.aurora_serverless.id
  description = "The ID of the Aurora DB cluster"
}

output "db_writer_endpoint" {
  value = aws_rds_cluster.aurora_serverless.endpoint
  description = "The writer endpoint for the Aurora DB cluster"
}

output "db_reader_endpoint" {
  value = aws_rds_cluster.aurora_serverless.reader_endpoint
  description = "The reader endpoint for the Aurora DB cluster"
}