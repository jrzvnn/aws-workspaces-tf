# AWS Workspaces Terraform Deployment
This repository contains Terraform code to deploy a full-stack AWS Workspace environment. AWS Workspaces provide a flexible, secure, and scalable solution for remote desktops in the cloud. This README will guide you through the deployment process.

## Prerequisites
 Before you begin, make sure you have the following prerequisites in place:
1. AWS Account: You will need an AWS account with sufficient permissions to create and manage AWS resources.
2. VPC with Subnets: Ensure you have an existing VPC with subnets set up in different availability zones (AZs) within your AWS account. Note down the subnet IDs of these subnets as you will need them during the deployment.
3. Workspace Bundle ID: You should have an AWS Workspace bundle ID for the specific configuration you want to use. This could be a custom bundle you've created or an AWS-provided bundle.
4. Terraform: Make sure you have Terraform installed on your local machine. You can download it from [Terraform's official website](https://www.terraform.io/).

## Getting Started
1. Clone this repository to your local machine:
```sh
git clone https://github.com/jrzvnn/aws-workspaces-tf.git
```
2. Navigate to the repository directory:
```sh
cd aws-workspaces-tf
```
3. Open the vpc.tf file and specify the subnet IDs and names for the subnets in your VPC. Update the following sections with your VPC and subnet information:
```
data "aws_vpc" "ws-vpc" {
  filter {
    name   = "tag:Name"
    values = ["ws-vpc"]
  }
}

data "aws_subnet" "ws-subnet-public1-us-east-1a" {
  id = "subnet-0da501d38881d1b4e"  # Replace with your subnet ID
}

data "aws_subnet" "ws-subnet-public3-us-east-1c" {
  id = "subnet-071d80add1256d91c"  # Replace with your subnet ID
}

```
4. Open the directory.tf file and specify your VPC name and subnet IDs in the aws_directory_service_directory resource section:
```
  vpc_settings {
    vpc_id     = "vpc-058e48eaf377299f0"  # Replace with your VPC ID
    subnet_ids = [
      "subnet-0da501d38881d1b4e",  # Replace with your subnet ID
      "subnet-071d80add1256d91c",  # Replace with your subnet ID
    ]
  }
```
5. Open the workspace.tf file and specify the AWS Workspaces bundle ID that you want to use:
```
data "aws_workspaces_bundle" "std_windows" {
  bundle_id = "wsb-gk1wpk43z"
}
```
## Deployment 

- Once you have updated the configuration files with your specific VPC, subnet, and bundle information, you can deploy the AWS Workspaces environment by running the following Terraform commands:
```sh
terraform init
terraform apply
```

## Cleanup
- To destroy the AWS Workspaces environment when you no longer need it, run:
```sh
terraform destroy
```

Credits to [Devkinetics](https://github.com/devkinetics) for this project.
