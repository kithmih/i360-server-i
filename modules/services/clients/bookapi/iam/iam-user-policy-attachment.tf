resource "aws_iam_user_policy_attachment" "at-1" {
  user       = aws_iam_user.app-user.name
  policy_arn = aws_iam_policy.policy.arn
}
