output "cluster_endpoint" {
  description = "Writer endpoint of the cluster"
  value       = aws_rds_cluster.this.endpoint
}

output "reader_endpoint" {
  description = "Reader endpoint of the cluster"
  value       = aws_rds_cluster.this.reader_endpoint
}
