# This sample, non-production-ready template describes AWS IaC.
# © 2021 Amazon Web Services, Inc. or its affiliates. All Rights Reserved. 
# This AWS Content is provided subject to the terms of the AWS Customer Agreement 
# available at http://aws.amazon.com/agreement or other written agreement 
# between Customer and either Amazon Web Services, Inc. or Amazon Web Services EMEA SARL or both.
resource "aws_config_configuration_recorder" "main" {
  name     = "${var.account_name}-aws-config-recorder-main"
  role_arn = aws_iam_role.config.arn
  recording_group {
    include_global_resource_types = true
  }
}

resource "aws_config_configuration_recorder_status" "main" {
  name       = aws_config_configuration_recorder.main.name
  is_enabled = true
  depends_on = [aws_config_delivery_channel.main]
}

resource "aws_config_delivery_channel" "main" {
  name           = "${var.account_name}-aws-config-delivery-channel-main"
  s3_bucket_name = "lv-tfstates-202108"
  snapshot_delivery_properties {
    delivery_frequency = "TwentyFour_Hours"
  }
  depends_on = [aws_config_configuration_recorder.main]
}