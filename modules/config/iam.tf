# This sample, non-production-ready template describes AWS IaC.
# © 2021 Amazon Web Services, Inc. or its affiliates. All Rights Reserved. 
# This AWS Content is provided subject to the terms of the AWS Customer Agreement 
# available at http://aws.amazon.com/agreement or other written agreement 
# between Customer and either Amazon Web Services, Inc. or Amazon Web Services EMEA SARL or both.

resource "aws_iam_role" "config" {
  name = "${var.account_name}-iam-role-aws-config"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "sts:AssumeRole"
        Principal = {
          Service = "config.amazonaws.com"
        },
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "config" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWS_ConfigRole"
  role       = aws_iam_role.config.name
}

resource "aws_iam_role_policy" "config_s3" {
  role = aws_iam_role.config.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = ["s3:*"]
        Resource = [
          "arn:aws:s3:::lv-tfstates-202108",
          "arn:aws:s3:::lv-tfstates-202108/*",
        ]
      }
    ]
  })
}