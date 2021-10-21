# This sample, non-production-ready template describes AWS IaC.
# © 2021 Amazon Web Services, Inc. or its affiliates. All Rights Reserved. 
# This AWS Content is provided subject to the terms of the AWS Customer Agreement 
# available at http://aws.amazon.com/agreement or other written agreement 
# between Customer and either Amazon Web Services, Inc. or Amazon Web Services EMEA SARL or both.

variable "aws_iam_user" {
  type = string

  default = "terraform"
}

variable "aws_iam_group" {
  type = string

  default = "terraform"
}

variable "created_account_id"{
  type = string
}


//For dependency
variable "aws_account_name"{
  type = string
  
  default = "terraform"
}


///add
variable "account" {
  type = string
}


variable "email" {
  type = string
}
