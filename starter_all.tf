# This sample, non-production-ready template describes AWS IaC.
# © 2021 Amazon Web Services, Inc. or its affiliates. All Rights Reserved. 
# This AWS Content is provided subject to the terms of the AWS Customer Agreement 
# available at http://aws.amazon.com/agreement or other written agreement 
# between Customer and either Amazon Web Services, Inc. or Amazon Web Services EMEA SARL or both.

//Create account under the organiztion without OU attachement.
module "account" {
  providers = {
    aws = aws.account // providerを渡す記述
  }
  source  = "./modules/createAccount"
  account = "TerraformDemo"
  email   = "tketomo+teraformdemo@amazon.co.jp"
}

//Call createUser and get Access key and Secret key info.
module "iam_user" {
  # providers = {
  #   aws = aws.user // providerを渡す記述
  # }
  source        = "./modules/createUser"
  #lv-project05-iam-user-terraform-serice
  aws_iam_user  = "terraform01"
  #lv-project05-iam-group-terraform-serice
  aws_iam_group = "terraform01"

  aws_account_name   = module.account.accountName
  created_account_id = module.account.created_account_id
  
  account = module.account.accountName
  email = module.account.accountEmail
}


//Create GitHub repository and set credential into its secrets.
module "github" {
  providers = {
    github = github.git // providerを渡す記述
  }
  source = "./modules/createRepository"
  name   = "terraform01"
  service_account_keys = {
    # Organization Admin User's credentials
    # Take over Output value.
    aws_access_key_id     = module.iam_user.access_key
    aws_secret_access_key = module.iam_user.encrypted_secret_key
  }
}


//Setup config.
module "config" {
  # providers = {
  #   aws = aws.user // providerを渡す記述
  # }
  source       = "./modules/config"
  account_name = module.account.accountName
  created_account_id = module.account.created_account_id

}

# //Setup moveOu.
# module "moveou" {
#   providers = {
#     aws = aws.account // providerを渡す記述
#   }
#   source       = "./modules/moveOu"
  
#   # account = module.account.accountName
#   # email = module.account.accountEmail
#   account = "lv-project05"
#   email   = "aws-root+lv-project05@group.lightvortex.com"
# }
