module "aurora_serverless" {
  source              = "./module"  # path to your module
  db_cluster_identifier = "my-aurora-cluster"
  db_master_username    = "admin"
  db_master_password    = "your_master_password"
  db_username_read      = "read_only_user"
  db_password_read      = "read_only_password"
  db_username_write     = "write_user"
  db_password_write     = "write_user_password"
}