output "redis_endpoint" {
  description = "Endpoint do Redis"
  value       = aws_elasticache_cluster.redis.cache_nodes[0].address
}

output "redis_port" {
  description = "Porta do Redis"
  value       = aws_elasticache_cluster.redis.port
}

output "redis_security_group_id" {
  description = "Security Group do Redis"
  value       = aws_security_group.redis.id
}