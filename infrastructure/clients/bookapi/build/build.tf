resource "aws_codebuild_project" "build" {

  for_each = {
    for index, vm in var.client.services :
    vm.name => vm
    # Create a an ECS deployment only if it's enabled
    if vm.codebuild == true
  }


  name          = "${var.owner}-${var.project}-codebuild-${var.client.name}-${each.value.name}"
  build_timeout = "10"
  service_role  = var.iam.build.arn

  artifacts {
    type = "NO_ARTIFACTS"
  }

  source {
    type            = "GITHUB"
    # location        = "https://github.com/KayVee78/book-api-practise.git"
    location        = "https://github.com/${var.github.user}/${join("-", [each.value.name , "practise"])}"
    git_clone_depth = 1

    git_submodules_config {
      fetch_submodules = true
    }
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/standard:4.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
    privileged_mode             = true

    environment_variable {
      name  = "IMAGE_REPO_NAME"
      value = "${var.owner}-${var.project}-${var.client.name}-${each.value.name}"
    }
    environment_variable {
      name  = "AWS_DEFAULT_REGION"
      value = var.region
    }
    environment_variable {
      name  = "AWS_ACCOUNT_ID"
      value = var.account
    }
  }

  logs_config {
    cloudwatch_logs {
      group_name = aws_cloudwatch_log_group.build-logs[each.key].name
    }
  }
}
