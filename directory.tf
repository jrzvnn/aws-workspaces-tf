resource "aws_directory_service_directory" "devopsph-ds" {
  name     = "devopsph.local"
  password = "#Dev0ps2022"
  size     = "Small"

  vpc_settings {
    vpc_id = "vpc-058e48eaf377299f0"
    subnet_ids = [
      "subnet-0da501d38881d1b4e",
      "subnet-071d80add1256d91c",
    ]
  }

  tags = {
    Name        = "devopsph.local"
    Environment = "Development"
    Purpose     = "AWS Workspaces Simple AD"
  }
}