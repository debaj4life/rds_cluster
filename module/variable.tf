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

variable "db_username_read" {
  description = "Username for the read-only user"
  type        = string
}

variable "db_password_read" {
  description = "Password for the read-only user"
  type        = string
  sensitive   = true
}

variable "db_username_write" {
  description = "Username for the write user"
  type        = string
}

variable "db_password_write" {
  description = "Password for the write user"
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


