variable "environment" {
  description = "Nome do ambiente"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR da VPC"
  type        = string
}

variable "public_subnets" {
  description = "Sub-redes públicas"
  type = map(object({
    cidr = string
    az   = string
  }))
}

variable "private_subnets" {
  description = "Sub-redes privadas"
  type = map(object({
    cidr = string
    az   = string
  }))
}

variable "tags" {
  description = "Tags comuns"
  type        = map(string)
  default     = {}
}