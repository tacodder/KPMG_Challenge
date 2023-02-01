#create a file for the VPC tier in AWS and deployed with Terraform:
provider "aws" {
  region = "us-west-2"
}

resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "private-vpc"
  }
}
