# This sample, non-production-ready template describes AWS IaC.
# © 2021 Amazon Web Services, Inc. or its affiliates. All Rights Reserved. 
# This AWS Content is provided subject to the terms of the AWS Customer Agreement 
# available at http://aws.amazon.com/agreement or other written agreement 
# between Customer and either Amazon Web Services, Inc. or Amazon Web Services EMEA SARL or both.

//Create new organization.
# resource "aws_organizations_organization" "org" {
#    aws_service_access_principals = [
#     "cloudtrail.amazonaws.com",
#     "config.amazonaws.com"
#    ]
#    feature_set = "ALL"
# }

//Create new OU and move Account to this OU.
# resource aws_organizations_organizational_unit ou1{
#    name = "ou1"
#    parent_id = aws_organizations_organization.org.roots[0].id
# }

resource aws_organizations_account account {
   name  = var.account
   email = var.email
#    depends_on = [
#     aws_organizations_organization.org
#  ]
  lifecycle {
    ignore_changes = [
      role_name,
    ]
  }
  
  # Change OU.
  # parent_id = "r-f5gh"
  
  provisioner "local-exec" {
    command = "sleep 600"
  }

}