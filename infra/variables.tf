variable "aws_region" {
  description = "Regiao AWS"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Ambiente da infraestrutura"
  type        = string
  default     = "dev"
}

variable "vpc_cidr" {
  description = "CIDR da VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "key_name" {
  description = "Nome da chave SSH existente"
  type        = string
  default     = "technova-key"
}

variable "db_name" {
  description = "Nome do banco PostgreSQL"
  type        = string
  default     = "reservas"
}

variable "db_username" {
  description = "Usuario do PostgreSQL"
  type        = string
  default     = "technova"
}

variable "db_password" {
  description = "Senha do PostgreSQL"
  type        = string
  sensitive   = true
}