terraform {
  backend "s3" {
    bucket = "devopsph-tfstate-default"
    key    = "aws-workspaces/terraform.tfstate"
    region = "us-east-1"
  }
}
