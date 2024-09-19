output "iam" {
  value = {
    ecs          = aws_iam_role.iam-role-for-ecs
    codepipeline = aws_iam_role.iam-role-codepipeline
  }
  description = "iam"
}
