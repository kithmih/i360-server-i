data "aws_ecr_repository" "ecr" {
  for_each = aws_cloudwatch_log_group.logs

  name = "${var.owner}-${var.project}-umbartha-${var.client.services[each.value.tags.key].name}"
}

