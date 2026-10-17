output "db_endpoints" {
  description = "Endpoints das instâncias PostgreSQL"
  value = {
    for name, db in aws_db_instance.postgres :
    name => db.endpoint
  }
}

output "db_addresses" {
  description = "Endereços DNS das instâncias PostgreSQL"
  value = {
    for name, db in aws_db_instance.postgres :
    name => db.address
  }
}

output "security_group_id" {
  description = "Security Group das instâncias RDS"
  value       = aws_security_group.rds.id
}