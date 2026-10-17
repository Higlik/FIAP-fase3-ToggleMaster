output "cluster_name" {
  description = "Nome do cluster EKS"
  value       = aws_eks_cluster.main.name
}

output "cluster_endpoint" {
  description = "Endpoint da API do Kubernetes"
  value       = aws_eks_cluster.main.endpoint
}

output "cluster_arn" {
  description = "ARN do cluster EKS"
  value       = aws_eks_cluster.main.arn
}

output "cluster_security_group_id" {
  description = "Security Group criado pelo EKS para o cluster"
  value       = aws_eks_cluster.main.vpc_config[0].cluster_security_group_id
}

output "node_group_name" {
  description = "Nome do Managed Node Group"
  value       = aws_eks_node_group.main.node_group_name
}

output "cluster_iam_role_arn" {
  description = "ARN da IAM Role do cluster"
  value       = aws_iam_role.cluster.arn
}

output "node_iam_role_arn" {
  description = "ARN da IAM Role dos nós"
  value       = aws_iam_role.nodes.arn
}