variable "project_name" {
  description = "Nome do projeto"
  type        = string
}

variable "environment" {
  description = "Ambiente da infraestrutura"
  type        = string
}

variable "queue_name" {
  description = "Nome da fila principal"
  type        = string
  default     = "togglemaster-evaluation-events"
}

variable "visibility_timeout_seconds" {
  description = "Tempo durante o qual uma mensagem fica invisível após ser recebida"
  type        = number
  default     = 60
}