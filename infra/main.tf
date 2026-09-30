module "vpc" {
  source = "./modules/vpc"

  environment = var.environment
  vpc_cidr    = var.vpc_cidr

  public_subnets = {
    public_a = {
      cidr = "10.0.1.0/24"
      az   = "us-east-1a"
    }

    public_b = {
      cidr = "10.0.2.0/24"
      az   = "us-east-1b"
    }
  }

  private_subnets = {
    private_a = {
      cidr = "10.0.11.0/24"
      az   = "us-east-1a"
    }

    private_b = {
      cidr = "10.0.12.0/24"
      az   = "us-east-1b"
    }
  }

  tags = {
    Project = "TechNova"
    Owner   = "Carollini-3925000"
  }
}

module "security_group" {
  source = "./modules/security-group"

  environment = var.environment
  vpc_id      = module.vpc.vpc_id

  ec2_ingress_rules = [
    {
      description = "SSH"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "API TechNova"
      from_port   = 3000
      to_port     = 3000
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  tags = {
    Project = "TechNova"
    Owner   = "Carollini-3925000"
  }
}

module "ec2" {
  source = "./modules/ec2"

  environment          = var.environment
  instance_type        = "t2.micro"
  subnet_id            = module.vpc.public_subnet_ids["public_a"]
  security_group_id    = module.security_group.ec2_security_group_id
  key_name             = var.key_name
  iam_instance_profile = "LabInstanceProfile"

  tags = {
    Project = "TechNova"
    Owner   = "Carollini-3925000"
  }
}

module "rds" {
  source = "./modules/rds"

  environment       = var.environment
  instance_class    = "db.t3.micro"
  subnet_ids        = values(module.vpc.private_subnet_ids)
  security_group_id = module.security_group.rds_security_group_id

  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password

  tags = {
    Project = "TechNova"
    Owner   = "Carollini-3925000"
  }
}