output "db_instance_id" {
  description = "ID da instancia RDS"
  value       = aws_db_instance.this.id
}

output "db_endpoint" {
  description = "Endpoint do RDS"
  value       = aws_db_instance.this.endpoint
}

output "db_address" {
  description = "Endereco do RDS"
  value       = aws_db_instance.this.address
}

output "db_port" {
  description = "Porta do RDS"
  value       = aws_db_instance.this.port
}