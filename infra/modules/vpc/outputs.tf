output "vpc_id" {
  description = "ID da VPC"
  value       = aws_vpc.this.id
}

output "public_subnet_ids" {
  description = "IDs das sub-redes públicas"
  value = {
    for key, subnet in aws_subnet.public : key => subnet.id
  }
}

output "private_subnet_ids" {
  description = "IDs das sub-redes privadas"
  value = {
    for key, subnet in aws_subnet.private : key => subnet.id
  }
}