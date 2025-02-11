# rds_cluster
Terraform Aurora MySQL Cluster Setup
This Terraform project sets up an Amazon Aurora MySQL Cluster with the following components:
Aurora RDS cluster with provisioned instances.
Creation of database users (read-only and write-only users) via Terraform.
Storing master credentials securely using AWS Secrets Manager.

Overview
The infrastructure is created in AWS using Terraform. The following components are created:

Aurora RDS Cluster:
A provisioned Aurora MySQL cluster is set up with user-defined parameters for the database engine and instance type.

Aurora RDS Cluster Instance:
An instance is created within the Aurora cluster, which connects to the cluster.

Database User Creation:
Two users (read_user and write_user) are created with specific access privileges to the database.

AWS Secrets Manager:
The master credentials (username and password) for Aurora are securely stored in AWS Secrets Manager.

Best Practices Followed
Sensitive Information:
Master password is stored securely in AWS Secrets Manager and retrieved dynamically. This eliminates the need to hardcode sensitive information in Terraform variables or configuration files.

Modular Code:
The Terraform code is organized into multiple modules to enhance reusability and maintainability. The main module responsible for creating the RDS cluster is separated from the user creation logic and the secret management configuration.

Provisioned Instances:
Aurora’s engine mode is set to provisioned, which ensures stable and predictable performance for production workloads. Aurora Serverless is typically used for scaling on-demand, but provisioned instances provide higher availability for critical systems.

Security Best Practices:
Security groups and VPC configurations (not shown here but typically managed) should ensure that only trusted sources can access the database.
IAM roles and permissions are considered when interacting with AWS Secrets Manager to ensure secure access to secrets.

File Structure


├── main.tf                 # Main configuration file that calls the module
├── provider.tf             # AWS provider configuration
├── modules/
│   ├── db_user.tf          # Creates read/write users with necessary privileges
│   ├── outputs.tf          # Outputs from the RDS setup 
│   ├── rds.tf              # Resources for creating RDS cluster, instances, and secrets
│   └── variable.tf         # Defines variables to be used across the configuration


Run the following command to see the proposed changes:
To apply the changes and create the resources, run:

terraform init
terraform plan
terraform apply

You will be prompted to confirm the changes by typing yes

Accessing the Database:
Once the infrastructure is created, use the db_writer_endpoint output to connect to the Aurora MySQL cluster.
You can retrieve the password for the master user from AWS Secrets Manager or use the db_master_password from your secrets management.

Example to connect via MySQL client:
mysql -h { my aurora cluster endpoint URL} -u admin -p

Modules Explanation
db_user.tf
This module creates the read and write database users with specific privileges on the database. The local-exec provisioner runs a MySQL script to create the users after the RDS instance is available.

outputs.tf
Outputs useful information, including:
Cluster endpoint: For connecting to the Aurora DB cluster.
Cluster ID: A unique identifier for the Aurora cluster.
Writer and Reader endpoints: Separate endpoints for writing and reading from the cluster.

rds.tf
Defines resources for the Aurora RDS cluster, including:
Cluster: The Aurora RDS cluster itself.
Instance: A provisioned Aurora instance attached to the cluster.
Secrets Manager: Creates and manages the master credentials for the database.

variable.tf
Defines variables to be used across the configuration. These include parameters for the Aurora instance class, database name, credentials, and more. You can customize these variables as needed for your specific use case.

Adhering to Best Practices:
Sensitive Data: We store the master password in AWS Secrets Manager instead of hardcoding it in Terraform variables to ensure security.
Modularity: The code is modularized for better readability and reuse, making it easier to maintain and scale.
IAM Permissions: Proper IAM permissions should be configured for accessing AWS resources, especially for managing secrets securely.
Separation of Concerns: The creation of users and database configurations are separated into different resources and modules, making the Terraform code more maintainable.
Conclusion
This setup provides a robust, secure, and highly available infrastructure for hosting an Aurora MySQL database on AWS, with automated creation of users and secure management of credentials.
