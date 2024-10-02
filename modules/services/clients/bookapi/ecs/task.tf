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

data "template_file" "contatiners" {
  for_each = aws_cloudwatch_log_group.logs

  template = file("${var.relative_path}/${var.client.services[each.value.tags.key].deploy.template}")

  vars = {
    service        = "${var.owner}-${var.project}-${var.client.name}-${var.client.services[each.value.tags.key].name}"
    log_group      = "${aws_cloudwatch_log_group.logs[each.key].name}"
    docker_image   = "${data.aws_ecr_repository.ecr[each.key].repository_url}:${lower(var.runtime.env.tick)}"
    env            = var.runtime.env.tick
    CONFIG_PROFILE = var.runtime.config.profile
    # REGION                  = local.db_creds.BOOKAPI_AWS_REGION
    # ACCESS_KEY_ID           = local.db_creds.BOOKAPI_ACCESS_KEY_ID
    # SECRET_ACCESS_KEY       = local.db_creds.BOOKAPI_SECRET_ACCESS_KEY
    # S3_BOOKAPI_BUCKET_NAME = local.db_creds.BOOKAPI_S3_BUCKET_NAME
    REGION                 = var.region
    ACCESS_KEY_ID          = var.access_key
    SECRET_ACCESS_KEY      = var.secret_access_key
    S3_BOOKAPI_BUCKET_NAME = var.s3.public.id
  }
}
