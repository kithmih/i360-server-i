output "secret_manager" {
  value       = aws_secretsmanager_secret.sm
  description = "AWS ECS VPC"
}
