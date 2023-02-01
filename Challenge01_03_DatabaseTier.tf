#file for the database tier in AWS and deployed with Terraform:
provider "aws" {
  region = "us-west-2"
}

module "vpc" {
  source = "./vpc"
}

module "public_subnet" {
  source = "./public_subnet"
}

resource "aws_db_instance" "database" {
  engine           = "mysql"
  instance_class   = "db.t2.micro"
  username         = "example_user"
  password         = "example_password"
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  subnet_id        = module.public_subnet.public_subnet_id

  tags = {
    Name = "example-database"
  }
}
