variable "project_name" {
  description = "Nome do projeto"
  type        = string
}

variable "environment" {
  description = "Ambiente da infraestrutura"
  type        = string
}

variable "vpc_id" {
  description = "ID da VPC onde os bancos serão criados"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR da VPC autorizado a acessar o PostgreSQL"
  type        = string
}

variable "private_subnet_ids" {
  description = "IDs das subnets privadas"
  type        = list(string)
}

variable "db_master_username" {
  description = "Usuário administrador dos bancos"
  type        = string
  default     = "tmadmin"
}

variable "db_passwords" {
  description = "Senhas individuais para cada instância RDS"
  type        = map(string)
  sensitive   = true
}