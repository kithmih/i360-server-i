resource "aws_iam_role" "iam-role-for-ecs" {
  name = "${var.owner}-${var.project}-${var.client.name}-${var.environment}-role-ecs"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": ["logs.${var.region}.amazonaws.com", "lambda.amazonaws.com", "cloudformation.amazonaws.com","ecs.amazonaws.com", "ec2.amazonaws.com", "firehose.amazonaws.com", "ecs-tasks.amazonaws.com"]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role" "iam-role-codepipeline" {
  name = "${var.owner}-${var.project}-${var.client.name}-${var.environment}-role-codepipeline"

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


