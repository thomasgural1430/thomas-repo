variable "db_identifier" {
  type = string
}

variable "db_allocated_storage" {
  type = number
}

variable "db_engine" {
  type    = string
  default = "postgres"
}

variable "db_engine_version" {
  type    = string
  default = "15.12"
}

variable "db_instance_class" {
  type = string
}

variable "db_storage_encrypted" {
  type    = bool
  default = false
}

variable "db_publicly_accessible" {
  type    = bool
  default = true
}

variable "db_delete_automated_backups" {
  type    = bool
  default = true
}

variable "db_skip_final_snapshot" {
  type    = bool
  default = true
}

variable "db_name" {
  type = string
}

variable "db_username" {
  type = string
}

variable "db_password" {
  type      = string
  sensitive = true
}

variable "db_apply_immediately" {
  type    = bool
  default = true
}

variable "db_multi_az" {
  type    = bool
  default = false
}

variable "db_subnet_group_name" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
}
