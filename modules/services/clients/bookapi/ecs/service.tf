resource "aws_ecs_service" "service" {

  for_each = aws_cloudwatch_log_group.logs

  name            = "${var.owner}-${var.project}-${var.client.name}-${var.client.services[each.value.tags.key].name}"
  cluster         = var.infrastructure.ecs_cluster.primary.arn
  task_definition = aws_ecs_task_definition.task[each.key].arn
  desired_count   = 1
  propagate_tags  = "TASK_DEFINITION"

  capacity_provider_strategy {
    capacity_provider = "FARGATE_SPOT"
    weight            = var.client.services[each.value.tags.key].deploy["fargate-spot"].weight
    base              = var.client.services[each.value.tags.key].deploy["fargate-spot"].base
  }

  capacity_provider_strategy {
    capacity_provider = "FARGATE"
    weight            = var.client.services[each.value.tags.key].deploy["fargate"].weight
  }

  network_configuration {
    assign_public_ip = true
    subnets          = [var.infrastructure.subnets.private1.id, var.infrastructure.subnets.private2.id]
    security_groups  = [var.infrastructure.security_groups.local.id]
  }

  tags = {
    stage = var.runtime.env.tick
  }

}
