resource "random_string" "random" {
  length  = 6
  special = false
  lower   = true
}

resource "aws_secretsmanager_secret" "sm" {
  name = "${var.owner}-${var.project}-${var.environment}-secret-manager-${random_string.random.result}"

  lifecycle {
    prevent_destroy = true

    ignore_changes = [
      name
    ]
  }
}
