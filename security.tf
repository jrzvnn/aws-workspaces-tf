resource "aws_kms_key" "workspaces-kms" {
  description             = "Workspaces KMS key"
  deletion_window_in_days = 7
}
