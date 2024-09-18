resource "aws_iam_role" "iam-role-codepipeline" {
  name               = "${var.owner}-${var.project}-${var.client.name}-${var.environment}-role-codepipeline"
  assume_role_policy = <<EOF

  {
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": ["logs.${var.region}.amazonaws.com","cloudformation.amazonaws.com", "codebuild.amazonaws.com", "codedeploy.amazonaws.com", "codepipeline.amazonaws.com"]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}
