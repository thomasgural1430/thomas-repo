output "ecr_repo_urls" {
  value = { for name, repo in aws_ecr_repository.this : name => repo.repository_url }
}