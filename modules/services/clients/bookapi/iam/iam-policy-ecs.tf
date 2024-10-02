resource "aws_iam_role_policy" "iam-role-policy-for-ecs" {
  role = aws_iam_role.iam-role-for-ecs.name

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [ 
      {
        "Effect": "Allow",
        "Action": [
            "ecr:GetAuthorizationToken",
            "ecr:BatchCheckLayerAvailability",
            "ecr:GetDownloadUrlForLayer",
            "ecr:BatchGetImage",
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:PutLogEvents"
        ],
        "Resource": "*"
    },
     {
        "Effect": "Allow",
        "Action": [
            "elasticfilesystem:ClientMount",
            "elasticfilesystem:ClientWrite",
            "elasticfilesystem:DescribeMountTargets",
            "elasticfilesystem:DescribeFileSystems"
        ],
        "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Resource": [
        "*"
      ],
      "Action": [
        "firehose:PutRecordBatch"
      ]
    },
    {
      "Effect": "Allow",
      "Resource": [
        "*"
      ],
      "Action": [
        "s3:GetObject", 
        "s3:GetBucketLocation", 
        "s3:PutObjectAcl"
      ]
    }, 
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
      "Effect": "Allow",
      "Resource": [
        "*"
      ],
      "Action": [
        "firehose:PutRecordBatch"
      ]
    },
    {
      "Effect": "Allow",
      "Action": [
        "ec2:CreateNetworkInterface",
        "ec2:DescribeDhcpOptions",
        "ec2:DescribeNetworkInterfaces",
        "ec2:DeleteNetworkInterface",
        "ec2:DescribeSubnets",
        "ec2:DescribeSecurityGroups",
        "ec2:DescribeVpcs"
      ],
      "Resource": "*"
    } ,
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
      "Effect": "Allow",
      "Action": [
          "cloudformation:*",
          "lambda:*", 
          "iam:*",
          "sns:*", 
          "events:*"
      ],
      "Resource": "*"
    },  
    {
      "Effect": "Allow",
      "Action": [
        "ec2:DescribeVpcs",
        "ec2:DescribeVpcAttribute",
        "ec2:DescribeSubnets",
        "ec2:DescribeSecurityGroups",
        "ec2:DescribeNetworkInterfaces",
        "ec2:CreateNetworkInterface",
        "ec2:CreateNetworkInterfacePermission",
        "ec2:DeleteNetworkInterface"
      ],
      "Resource": [ "*" ]
     }, 
     {
      "Effect": "Allow",
      "Action": [
        "firehose:*"
      ],
      "Resource": [ "*" ]
     }
  ]
}
POLICY
}
