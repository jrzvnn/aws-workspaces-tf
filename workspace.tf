data "aws_workspaces_bundle" "std_windows" {
  bundle_id = "wsb-gk1wpk43z"
}

resource "aws_workspaces_workspace" "workspaces" {
  directory_id = aws_workspaces_directory.workspaces-directory.id
  bundle_id    = data.aws_workspaces_bundle.std_windows.id

  user_name = "devopsph.local\\Administrator"

  root_volume_encryption_enabled = true
  user_volume_encryption_enabled = true

  volume_encryption_key = "arn:aws:kms:us-east-1:353472581086:key/7bfec753-51eb-4f3b-b271-93c431389fdf"

  workspace_properties {
    compute_type_name                         = "STANDARD"
    user_volume_size_gib                      = 50
    root_volume_size_gib                      = 80
    running_mode                              = "AUTO_STOP"
    running_mode_auto_stop_timeout_in_minutes = 60
  }

  tags = {
    Name = "devopsph-workspaces"
  }

  depends_on = [
    aws_iam_role.workspaces-default,
    aws_workspaces_directory.workspaces-directory
  ]
}

