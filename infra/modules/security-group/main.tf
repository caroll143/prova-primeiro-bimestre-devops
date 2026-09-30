resource "aws_security_group" "ec2" {
  name        = "${var.environment}-technova-ec2-sg"
  description = "Security Group da API TechNova"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.ec2_ingress_rules

    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    description = "Permite saida para a Internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.environment}-technova-ec2-sg"
    }
  )
}

resource "aws_security_group" "rds" {
  name        = "${var.environment}-technova-rds-sg"
  description = "Security Group do RDS PostgreSQL"
  vpc_id      = var.vpc_id

  ingress {
    description     = "PostgreSQL somente da EC2"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.ec2.id]
  }

  egress {
    description = "Permite saida"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.environment}-technova-rds-sg"
    }
  )
}