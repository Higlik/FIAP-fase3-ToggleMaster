variable "project_name" {
  description = "Nome do projeto"
  type        = string
}

variable "environment" {
  description = "Ambiente da infraestrutura"
  type        = string
}

variable "private_subnet_ids" {
  description = "IDs das subnets privadas utilizadas pelos Node Groups"
  type        = list(string)
}

variable "public_subnet_ids" {
  description = "IDs das subnets públicas da VPC"
  type        = list(string)
}

variable "endpoint_public_access" {
  description = "Permite acesso público ao endpoint do cluster"
  type        = bool
  default     = true
}

variable "endpoint_private_access" {
  description = "Permite acesso ao endpoint pela VPC"
  type        = bool
  default     = true
}

variable "node_instance_types" {
  description = "Tipos de instância EC2 dos Node Groups"
  type        = list(string)
  default     = ["t3.small"]
}

variable "node_desired_size" {
  description = "Quantidade desejada de nós"
  type        = number
  default     = 1
}

variable "node_min_size" {
  description = "Quantidade mínima de nós"
  type        = number
  default     = 1
}

variable "node_max_size" {
  description = "Quantidade máxima de nós"
  type        = number
  default     = 2
}

variable "node_disk_size" {
  description = "Tamanho do disco dos nós, em GiB"
  type        = number
  default     = 20
}