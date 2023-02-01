#file for the public subnet tier in AWS and deployed with Terraform:
provider "aws" {
  region = "us-west-2"
}

module "vpc" {
  source = "./vpc"
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = module.vpc.vpc_id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "public-subnet"
  }
}
