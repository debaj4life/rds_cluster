# rds_cluster
Username and Password for the master db user is what you give it.
its automatically stored in AWS Secrets manager.
To view your password  on secret manager run the below command

aws secretsmanager get-secret-value --secret-id db_master_password --query SecretString --output text
{“password”:“your_master_password”}