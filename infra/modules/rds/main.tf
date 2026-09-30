resource "aws_db_subnet_group" "this" {
  name       = "${var.environment}-technova-db-subnet-group"
  subnet_ids = var.subnet_ids

  tags = merge(
    var.tags,
    {
      Name = "${var.environment}-technova-db-subnet-group"
    }
  )
}

resource "aws_db_instance" "this" {
  identifier = "${var.environment}-technova-postgres"

  engine         = "postgres"
  engine_version = "16"

  instance_class        = var.instance_class
  allocated_storage     = 20
  max_allocated_storage = 20
  storage_type          = "gp3"

  db_name  = var.db_name
  username = var.db_username
  password = var.db_password
  port     = 5432

  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = [var.security_group_id]

  publicly_accessible = false
  storage_encrypted   = true

  skip_final_snapshot = true
  deletion_protection = false

  backup_retention_period = 1

  tags = merge(
    var.tags,
    {
      Name = "${var.environment}-technova-postgres"
    }
  )
}