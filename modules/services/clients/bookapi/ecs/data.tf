data "aws_ecr_repository" "ecr" {
  for_each = aws_cloudwatch_log_group.logs

  name = "${var.owner}-${var.project}-bookapi-${var.client.services[each.value.tags.key].name}"
}

# data "aws_secretsmanager_secret_version" "creds" {
#   secret_id = var.managed.secret_manager.id
# }
