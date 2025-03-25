# Creating iam instance profile
resource "aws_iam_instance_profile" "webapp_profile" {
  name = "webapp_profile"
  role = aws_iam_role.webapp_iam_role.name
}

# Creating iam role policy
resource "aws_iam_role_policy" "webapp_policy" {
  name = "webapp_policy"
  role = aws_iam_role.webapp_iam_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:*",
        ]
        Effect = "Allow"
        Resource = [
          "arn:aws:s3:::${aws_s3_bucket.my_s3_bucket.id}",
          "arn:aws:s3:::${aws_s3_bucket.my_s3_bucket.id}/*"
        ]
      },
      {
        Action = [
          "rds:*",
        ]
        Effect = "Allow"
        Resource = [
          "arn:aws:rds:::db:${aws_db_instance.mysql_db_instance.db_name}"
        ]
      },
      {
        Sid    = "CWACloudWatchServerPermissions",
        Effect = "Allow",
        Action = [
          "cloudwatch:PutMetricData",
          "ec2:DescribeVolumes",
          "ec2:DescribeTags",
          "logs:PutLogEvents",
          "logs:PutRetentionPolicy",
          "logs:DescribeLogStreams",
          "logs:DescribeLogGroups",
          "logs:CreateLogStream",
          "logs:CreateLogGroup",
          "xray:PutTraceSegments",
          "xray:PutTelemetryRecords",
          "xray:GetSamplingRules",
          "xray:GetSamplingTargets",
          "xray:GetSamplingStatisticSummaries"
        ],
        Resource = "*"
      },
      {
        Sid    = "CWASSMServerPermissions",
        Effect = "Allow",
        Action = [
          "ssm:GetParameter"
        ],
        Resource = "arn:aws:ssm:*:*:parameter/AmazonCloudWatch-*"
      }
    ]
  })
}

# Creating iam role
resource "aws_iam_role" "webapp_iam_role" {
  name = "webapp_iam_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}