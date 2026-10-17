output "queue_name" {
  description = "Nome da fila principal"
  value       = aws_sqs_queue.main.name
}

output "queue_url" {
  description = "URL da fila principal"
  value       = aws_sqs_queue.main.url
}

output "queue_arn" {
  description = "ARN da fila principal"
  value       = aws_sqs_queue.main.arn
}

output "dlq_arn" {
  description = "ARN da fila de mensagens mortas"
  value       = aws_sqs_queue.dlq.arn
}