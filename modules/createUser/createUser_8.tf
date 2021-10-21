# This sample, non-production-ready template describes AWS IaC.
# © 2021 Amazon Web Services, Inc. or its affiliates. All Rights Reserved. 
# This AWS Content is provided subject to the terms of the AWS Customer Agreement 
# available at http://aws.amazon.com/agreement or other written agreement 
# between Customer and either Amazon Web Services, Inc. or Amazon Web Services EMEA SARL or both.

//////////////////////////////////////////
// IAM User creation
//////////////////////////////////////////
resource "aws_iam_user" "example_exp" {
  name          = var.aws_iam_user
  force_destroy = true
}

//This password policy setting is not necessary for our credential based access account.
# resource "aws_iam_user_login_profile" "example_exp_login_profile" {
#   user                    = aws_iam_user.example_exp.name
#   pgp_key                 = "keybase:exp_example"
#   # password_reset_required = true
#   # password_length         = "20"
# }

resource "aws_iam_access_key" "example_exp_access_key" {
  user    = aws_iam_user.example_exp.name
  pgp_key = "keybase:exp_example"
}

//////////////////////////////////////////
// IAM Group creation
//////////////////////////////////////////
resource "aws_iam_group_membership" "example_exp_group_membership" {
  name  = "example_exp_group_membership"
  users = [
    aws_iam_user.example_exp.name,
  ]
  group = var.aws_iam_group
}

resource "aws_iam_group" "example_exp_group" {
  name  = var.aws_iam_group
}

resource "aws_iam_group_policy_attachment" "policy-attach" {
   group      = aws_iam_group.example_exp_group.name
   policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

//////////////////////////////////////////
// S3 Bucket Public Access Block
//////////////////////////////////////////
resource "aws_s3_account_public_access_block" "main" {
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# resource aws_organizations_account account {
#   name  = var.account
#   email = var.email
   
#   parent_id = "ou-f5gh-9iyob7d3"
   
#     depends_on = [
#       aws_s3_account_public_access_block.main,
#   ]
#   # lifecycle {
#   #   ignore_changes = [
#   #     role_name,
#   #   ]
#   # }

# }