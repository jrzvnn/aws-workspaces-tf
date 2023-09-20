# Custom workspace created from custom image and bundle

data "aws_workspaces_bundle" "ws-test-bundle" {
  bundle_id = "wsb-gk1wpk43z"
}

resource "aws_workspaces_workspace" "ws-test" {
  directory_id = aws_workspaces_directory.workspaces-directory.id
  bundle_id    = data.aws_workspaces_bundle.ws-test-bundle.id

  user_name = "devopsph.local\\Guest"

  root_volume_encryption_enabled = true
  user_volume_encryption_enabled = true
  volume_encryption_key          = aws_kms_key.workspaces-kms.arn

  workspace_properties {
    running_mode                              = "AUTO_STOP"
    running_mode_auto_stop_timeout_in_minutes = 60
  }

  tags = {
    Name = "ws-test-image"
  }

}
