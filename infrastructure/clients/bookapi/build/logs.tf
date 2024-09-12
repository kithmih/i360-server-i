resource "aws_cloudwatch_log_group" "build-logs" {

  for_each = {
    for index, vm in var.client.services :
    vm.name => vm
    # Create a an ECS deployment only if it's enabled
    if vm.codebuild == true
  }

  name              = "${var.owner}-${var.project}-build-logs-${var.client.name}-${each.value.name}"
  retention_in_days = var.client.services.api.build.log_retention
}
