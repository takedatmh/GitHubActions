# This sample, non-production-ready template describes AWS IaC.
# © 2021 Amazon Web Services, Inc. or its affiliates. All Rights Reserved. 
# This AWS Content is provided subject to the terms of the AWS Customer Agreement 
# available at http://aws.amazon.com/agreement or other written agreement 
# between Customer and either Amazon Web Services, Inc. or Amazon Web Services EMEA SARL or both.

resource "github_repository" "repository" {
  name       = var.name
  description = "platform repository"
  visibility = "private"
  has_issues = true

  template {
    owner      = "tketomo"
    repository = "tf-aws-project-template"
  }
  
}
