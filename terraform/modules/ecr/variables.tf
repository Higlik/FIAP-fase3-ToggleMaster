variable "project_name" {
  description = "Nome do projeto"
  type        = string
}

variable "environment" {
  description = "Ambiente da infraestrutura"
  type        = string
}

variable "repository_names" {
  description = "Nomes dos repositórios dos microsserviços"
  type        = list(string)

  validation {
    condition     = length(var.repository_names) == 5
    error_message = "Devem ser informados exatamente cinco repositórios."
  }
}