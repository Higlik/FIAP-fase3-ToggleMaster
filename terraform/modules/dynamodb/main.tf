resource "aws_dynamodb_table" "analytics" {
  name         = var.table_name
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "event_id"

  attribute {
    name = "event_id"
    type = "S"
  }

  deletion_protection_enabled = false

  tags = {
    Name        = var.table_name
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}