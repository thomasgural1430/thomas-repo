resource "aws_ecr_repository" "this" {
  for_each = toset(var.repositories)

  name = each.value

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }

  image_tag_mutability = var.image_tag_mutability
}

