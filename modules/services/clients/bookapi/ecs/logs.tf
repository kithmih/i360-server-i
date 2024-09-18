resource "aws_cloudwatch_log_group" "logs" {
  for_each = {
    for index, vm in var.client.services :
    vm.name => vm
    # Create a an ECS deployment only if it's enabled
    if vm.autodeploy == true
  }


  name              = "${var.client.runtime.log.path}/${var.owner}-${var.project}/${var.environment}/bookapi-${each.value.name}/"
  retention_in_days = var.client.runtime.log.retention

  tags = {
    key = replace(each.key, "-", "_")
  }
}

