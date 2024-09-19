resource "aws_ecr_repository" "ecr-api" {

  for_each = {
    for index, vm in var.services :
    vm.name => vm
  }

  name = "${var.owner}-${var.project}-bookapi-${each.value.name}"

  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
}
