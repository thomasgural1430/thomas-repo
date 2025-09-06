variable "cluster_identifier" {
  description = "Aurora cluster identifier"
  type        = string
}

variable "engine" {
  description = "Aurora engine"
  type        = string
  default     = "aurora-postgresql"
}

variable "engine_version" {
  description = "Aurora engine version"
  type        = string
}

variable "database_name" {
  description = "Initial database name"
  type        = string
}

variable "master_username" {
  description = "Master username"
  type        = string
}

variable "master_password" {
  description = "Master password"
  type        = string
  sensitive   = true
}

variable "instance_class" {
  description = "Aurora instance class"
  type        = string
}

variable "subnet_ids" {
  description = "Private subnet IDs"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "security_group_ids" {
  description = "Security groups for RDS cluster"
  type        = list(string)
}

variable "project" {
  type = string
}

variable "owner" {
  type = string
}

variable "skip_final_snapshot" {
  description = "Whether to skip creating a final snapshot on cluster deletion"
  type        = bool
  default     = true
}

variable "final_snapshot_identifier" {
  description = "Final snapshot identifier if skip_final_snapshot is false"
  type        = string
  default     = null
}

