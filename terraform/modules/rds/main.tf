locals {
  databases = {
    auth = {
      db_name = "auth_db"
    }

    flags = {
      db_name = "flags_db"
    }

    evaluation = {
      db_name = "evaluation_db"
    }
  }
}

resource "aws_security_group" "rds" {
  name        = "${var.project_name}-${var.environment}-rds-sg"
  description = "Acesso interno aos bancos PostgreSQL"
  vpc_id      = var.vpc_id

  ingress {
    description = "PostgreSQL dentro da VPC"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    description = "Saida de rede"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-rds-sg"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_db_subnet_group" "main" {
  name        = "${var.project_name}-${var.environment}-rds-subnets"
  description = "Subnets privadas para os bancos PostgreSQL"

  subnet_ids = var.private_subnet_ids

  tags = {
    Name        = "${var.project_name}-${var.environment}-rds-subnets"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_db_instance" "postgres" {
  for_each = local.databases

  identifier = "${var.project_name}-${var.environment}-${each.key}-postgres"

  engine         = "postgres"
  instance_class = "db.t3.micro"

  db_name  = each.value.db_name
  username = var.db_master_username
  password = var.db_passwords[each.key]

  allocated_storage = 20
  storage_type      = "gp3"
  storage_encrypted = true

  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.rds.id]

  publicly_accessible = false
  multi_az             = false

  backup_retention_period = 0
  deletion_protection     = false
  skip_final_snapshot     = true

  auto_minor_version_upgrade = true

  tags = {
    Name        = "${var.project_name}-${var.environment}-${each.key}-postgres"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}