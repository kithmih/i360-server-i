
resource "aws_iam_role_policy" "policy-build" {
  role = aws_iam_role.build-role.name

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Resource": [
        "*"
      ],
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ]
    },     
    {
      "Action": [
          "ecs:*",
          "elasticloadbalancing:DescribeTargetGroups",
          "elasticloadbalancing:DescribeListeners",
          "elasticloadbalancing:ModifyListener",
          "elasticloadbalancing:DescribeRules",
          "elasticloadbalancing:ModifyRule",
          "lambda:InvokeFunction",
          "cloudwatch:DescribeAlarms",
          "sns:Publish",
          "s3:PutObject",
          "s3:GetObject",
          "s3:GetObjectVersion"
      ],
      "Resource": "*",
      "Effect": "Allow"
    },
    {
      "Effect": "Allow",
      "Action": [
        "codebuild:BatchGetBuilds",
        "codebuild:StartBuild"
      ],
      "Resource": "*"
    }, 
    {
      "Effect": "Allow",
      "Action": [
        "ecr:BatchCheckLayerAvailability",
        "ecr:GetAuthorizationToken", 
        "ecr:BatchGetImage",
        "ecr:GetDownloadUrlForLayer",
        "ecr:",
        "ecr:InitiateLayerUpload", 
        "ecr:UploadLayerPart",
        "ecr:DescribeRepositories",
        "ecr:ListImages",
        "ecr:CompleteLayerUpload", 
        "ecr:PutImage"
      ],
      "Resource": "*"
    },  
    {
        "Action": [
            "iam:PassRole"
        ],
        "Effect": "Allow",
        "Resource": "*",
        "Condition": {
            "StringLike": {
                "iam:PassedToService": [
                    "ecs-tasks.amazonaws.com"
                ]
            }
        }
    }
  ]
}
POLICY
}
