output "application_name" {
  description = "Elastic Beanstalk Application Name"
  value       = aws_elastic_beanstalk_application.this.name
}

output "environment_name" {
  description = "Elastic Beanstalk Environment Name"
  value       = aws_elastic_beanstalk_environment.this.name
}

output "environment_endpoint" {
  description = "Elastic Beanstalk Environment Endpoint URL"
  value       = aws_elastic_beanstalk_environment.this.endpoint_url
}

output "environment_id" {
  description = "Elastic Beanstalk Environment ID"
  value       = aws_elastic_beanstalk_environment.this.id
}
