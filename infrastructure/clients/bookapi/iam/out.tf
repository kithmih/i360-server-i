output "iam" {
  value = {
    build = aws_iam_role.build-role
  }
  description = "iam"
}
