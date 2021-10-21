# This sample, non-production-ready template describes AWS IaC.
# © 2021 Amazon Web Services, Inc. or its affiliates. All Rights Reserved. 
# This AWS Content is provided subject to the terms of the AWS Customer Agreement 
# available at http://aws.amazon.com/agreement or other written agreement 
# between Customer and either Amazon Web Services, Inc. or Amazon Web Services EMEA SARL or both.

resource "github_actions_secret" "service_account_keys" {
  for_each = var.service_account_keys

  repository      = github_repository.repository.name
  secret_name     = "${each.key}"
  plaintext_value = each.value
}
