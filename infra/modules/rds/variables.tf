variable "environment" {
  description = "Nome do ambiente"
  type        = string
}

variable "instance_class" {
  description = "Classe da instancia RDS"
  type        = string
  default     = "db.t3.micro"
}

variable "subnet_ids" {
  description = "Subnets privadas do RDS"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security Group do RDS"
  type        = string
}

variable "db_name" {
  description = "Nome do banco"
  type        = string
}

variable "db_username" {
  description = "Usuario do banco"
  type        = string
}

variable "db_password" {
  description = "Senha do banco"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Tags comuns"
  type        = map(string)
  default     = {}
}