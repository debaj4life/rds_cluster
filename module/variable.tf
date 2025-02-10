variable "db_cluster_identifier" {
  description = "The identifier for the Aurora DB cluster"
  type        = string
}

variable "db_master_username" {
  description = "Master username for Aurora MySQL"
  type        = string
}

variable "db_master_password" {
  description = "Master password for Aurora MySQL"
  type        = string
  sensitive   = true
}

variable "instance_class" {
  description = "instance type"
  type        = string
  default     = "db.r5.large" 
}

variable "engine" {
  description = "engine type"
  type        = string
  default     = "aurora-mysql" 
}

variable "engine_mode" {
  description = "engine mode"
  type        = string
  default     = "provisioned" 
}

variable "database_name" {
  description = "name of database"
  type        = string
  default     = "opencorporatedb" 
}


