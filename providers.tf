# This sample, non-production-ready template describes AWS IaC.
# © 2021 Amazon Web Services, Inc. or its affiliates. All Rights Reserved. 
# This AWS Content is provided subject to the terms of the AWS Customer Agreement 
# available at http://aws.amazon.com/agreement or other written agreement 
# between Customer and either Amazon Web Services, Inc. or Amazon Web Services EMEA SARL or both.

/////////////////////////////////
// Configure the GitHub Provider
/////////////////////////////////
provider "github" {
  alias        = "git"
  organization = "tketomo"
}

/////////////////////////
// Provider for Create User
/////////////////////////

# #Definition of Variables 
# variable "aws_access_key_id" {}
# variable "aws_secret_access_key" {}

/////////////////////////////////
// Account Creation Provider
/////////////////////////////////
provider "aws" {
  alias      = "account"
  region     = "ap-northeast-1"

}

terraform {
  backend "s3" {
    region = "ap-northeast-1"
    bucket = "lv-tfstates-202108"
    key = "awsdemo/terraform.tfstate"
  }
}
