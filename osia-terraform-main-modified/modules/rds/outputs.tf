output "osia_db_arn" {
  value = aws_db_instance.osiadb1.arn
}

output "osia_db_username" {
  value = aws_db_instance.osiadb1.username
}

output "osia_db_password" {
  value     = aws_db_instance.osiadb1.password
  sensitive = true
}

output "osia_db_host" {
  value = aws_db_instance.osiadb1.endpoint
}
