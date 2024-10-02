resource "aws_iam_role_policy" "iam-role-policy-codepipeline" {
  role = aws_iam_role.iam-role-codepipeline.name

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [ 
      {
        "Effect": "Allow",
        "Action": [
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:PutLogEvents"
        ],
        "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Resource": [
        "${data.aws_s3_bucket.artifacts.arn}",
        "${data.aws_s3_bucket.artifacts.arn}/*"
      ],
      "Action": [
        "s3:GetObject",
        "s3:GetObjectVersion",
        "s3:GetBucketVersioning",
        "s3:PutObjectAcl",
        "s3:PutObject"
      ]
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
        "ecs:*", 
        "ssm:GetParameters",
        "elasticloadbalancing:DescribeTargetGroups",
        "elasticloadbalancing:DescribeListeners",
        "elasticloadbalancing:ModifyListener",
        "elasticloadbalancing:DescribeRules",
        "elasticloadbalancing:ModifyRule",
        "lambda:InvokeFunction",
        "cloudwatch:DescribeAlarms",
        "sns:Publish",
        "s3:GetObject",
        "s3:GetObjectVersion"
      ],
      "Resource": "*"
    }, 
    {
      "Action": [
          "codestar-connections:UseConnection"
      ],
      "Resource": "*",
      "Effect": "Allow"
    }, 
    {
      "Action": [
        "codedeploy:CreateDeployment",
        "codedeploy:GetApplicationRevision",
        "codedeploy:GetApplication",
        "codedeploy:GetDeployment",
        "codedeploy:GetDeploymentConfig",
        "codedeploy:RegisterApplicationRevision"
      ],
      "Resource": "*",
      "Effect": "Allow"
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
