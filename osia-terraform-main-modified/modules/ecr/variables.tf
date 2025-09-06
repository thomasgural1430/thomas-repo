variable "name" {
  description = "ECR repository name"
  type        = string
}

variable "image_tag_mutability" {
  description = "Tag mutability setting for the repository (MUTABLE or IMMUTABLE)"
  type        = string
  default     = "IMMUTABLE"
}

variable "scan_on_push" {
  description = "Enable scan on push"
  type        = bool
  default     = true
}

variable "project" {
  description = "Project name for tagging"
  type        = string
}

variable "owner" {
  description = "Owner for tagging"
  type        = string
}
