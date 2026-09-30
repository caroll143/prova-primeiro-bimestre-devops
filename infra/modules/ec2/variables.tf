variable "environment" {
  description = "Nome do ambiente"
  type        = string
}

variable "instance_type" {
  description = "Tipo da instancia EC2"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "Subnet publica da EC2"
  type        = string
}

variable "security_group_id" {
  description = "Security Group da EC2"
  type        = string
}

variable "key_name" {
  description = "Nome da chave SSH"
  type        = string
}

variable "iam_instance_profile" {
  description = "Instance Profile existente do Learner Lab"
  type        = string
  default     = "LabInstanceProfile"
}

variable "tags" {
  description = "Tags comuns"
  type        = map(string)
  default     = {}
}