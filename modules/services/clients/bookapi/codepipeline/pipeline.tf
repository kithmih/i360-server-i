resource "aws_codepipeline" "pipeline" {
  for_each = {
    for index, vm in var.client.services :
    vm.name => vm
    # Create an ECS deployment only if it's enabled
    if vm.codebuild == true
  }

  name     = "${var.owner}-${var.project}-${var.client.name}-${replace(each.value.name, "bookapi", "")}-${var.environment}-pipeline"
  role_arn = var.iam.codepipeline.arn

  artifact_store {
    location = data.aws_s3_bucket.artifacts.bucket
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeConnection"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        ConnectionArn    = var.github.codestar_connection
        FullRepositoryId = "${var.github.user}/${join("-", [each.value.name, "practise"])}"
        # BranchName       = lower(var.environment)
        BranchName = "main"
      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]
      version          = "1"

      configuration = {
        EnvironmentVariables = "[{\"name\":\"IMAGE_TAG\",\"value\":\"${lower(var.environment)}\",\"type\":\"PLAINTEXT\"},{\"name\":\"CONTAINER_NAME\",\"value\":\"${join("-", ["${var.owner}-${var.project}-${var.client.name}", each.value.name])}\",\"type\":\"PLAINTEXT\"}]"
        ProjectName          = "${var.owner}-${var.project}-codebuild-${var.client.name}-${each.value.name}"
      }
    }
  }
}
