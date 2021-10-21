# This sample, non-production-ready template describes AWS IaC. 
# © 2021 Amazon Web Services, Inc. or its affiliates. All Rights Reserved. 
# This AWS Content is provided subject to the terms of the AWS Customer Agreement 
# available at http://aws.amazon.com/agreement or other written agreement 
# between Customer and either Amazon Web Services, Inc. or Amazon Web Services EMEA SARL or both.

resource aws_organizations_account account {
#   name  = var.account
#   email = var.email
  name = "lv-project05"
  email   = "aws-root+lv-project05@group.lightvortex.com"
  parent_id = "ou-f5gh-9iyob7d3"

  # lifecycle {
  #   ignore_changes = [
  #     role_name,
  #   ]
  # }
  
}

provider "aws" {
#   alias      = "account"
  region     = "ap-northeast-1"

}

terraform {
  backend "s3" {
    region = "ap-northeast-1"
    bucket = "lv-log-s3-tfstate-586833220365"
    key = "awsdemo/terraform.tfstate"
  }
}
