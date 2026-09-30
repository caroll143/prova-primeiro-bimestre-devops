output "vpc_id" {
  description = "ID da VPC"
  value       = module.vpc.vpc_id
}

output "ec2_public_ip" {
  description = "IP publico da EC2"
  value       = module.ec2.public_ip
}

output "ec2_public_dns" {
  description = "DNS publico da EC2"
  value       = module.ec2.public_dns
}

output "rds_endpoint" {
  description = "Endpoint do RDS"
  value       = module.rds.db_endpoint
}

output "api_url" {
  description = "URL da API"
  value       = "http://${module.ec2.public_ip}:3000"
}