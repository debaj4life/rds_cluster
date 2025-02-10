module "aurora_serverless" {
  source              = "./module"  # path to your module
  db_cluster_identifier = "my-aurora-cluster"
  db_master_username    = "admin"
  db_master_password    = "your_master_password"
  
}
