resource "aws_ecs_task_definition" "task" {
  for_each = aws_cloudwatch_log_group.logs

  family                   = "${var.owner}-${var.project}-${var.client.name}-${var.client.services[each.value.tags.key].name}_${var.runtime.env.tick}"
  container_definitions    = data.template_file.contatiners[each.key].rendered
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = var.client.services[each.value.tags.key].deploy.cpu
  memory                   = var.client.services[each.value.tags.key].deploy.memory
  execution_role_arn       = var.iam.ecs.arn
  tags = {
    stage = var.runtime.env.tick
  }
}
