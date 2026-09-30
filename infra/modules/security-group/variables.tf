variable "environment" {
  description = "Nome do ambiente"
  type        = string
}

variable "vpc_id" {
  description = "ID da VPC"
  type        = string
}

variable "ec2_ingress_rules" {
  description = "Regras de entrada da EC2"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "tags" {
  description = "Tags comuns"
  type        = map(string)
  default     = {}
}