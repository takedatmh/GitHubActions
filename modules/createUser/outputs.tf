# This sample, non-production-ready template describes AWS IaC.
# © 2021 Amazon Web Services, Inc. or its affiliates. All Rights Reserved. 
# This AWS Content is provided subject to the terms of the AWS Customer Agreement 
# available at http://aws.amazon.com/agreement or other written agreement 
# between Customer and either Amazon Web Services, Inc. or Amazon Web Services EMEA SARL or both.

output "encrypted_secret_key" {
  value = join("\n", aws_iam_access_key.example_exp_access_key.*.encrypted_secret)
}

output "access_key" {
  value = join("\n", aws_iam_access_key.example_exp_access_key.*.id)
}

output "user" {
  value = join("\n", aws_iam_access_key.example_exp_access_key.*.user)
}

