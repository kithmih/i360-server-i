resource "aws_iam_policy" "policy" {
  name        = "${var.owner}-${var.project}-${var.client.name}-${var.environment}-policy-s3-access"
  path        = "/"
  description = "S3 Resource Access Policy - Upload Only"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:PutObject",
          "s3:GetObject",
          "s3:ListBucket"
        ]
        Effect = "Allow"
        Resource = [
          "${var.s3.private.arn}",
          "${var.s3.private.arn}/*"
        ],
      },
      {
        Action = [
          "ses:*"
        ]
        Effect   = "Allow"
        Resource = "*",
      }
    ]
  })
}
