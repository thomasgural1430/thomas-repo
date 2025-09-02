variable "repositories" {
  description = "List of ECR repository names to create"
  type        = list(string)
}

variable "scan_on_push" {
  description = "Enable image scanning on push"
  type        = bool
}

variable "image_tag_mutability" {
  description = "Image tag mutability (MUTABLE or IMMUTABLE)"
  type        = string
}
