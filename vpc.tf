data "aws_vpc" "ws-vpc" {
  filter {
    name   = "tag:Name"
    values = ["ws-vpc"]
  }
}

data "aws_subnet" "ws-subnet-public1-us-east-1a" {
  id = "subnet-0da501d38881d1b4e"
}

data "aws_subnet" "ws-subnet-public3-us-east-1c" {
  id = "subnet-071d80add1256d91c"
}
