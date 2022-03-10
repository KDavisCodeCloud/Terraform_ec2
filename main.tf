
#Configure your instance first by using the AWS CLI and getting access keys and security Keys. 


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

#cloud provider (in this case, amazon web services) and the region used. 
provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

#using an existing image server ami, and the size of that instance. Using the free tier in this case
resource "aws_instance" "my_server" {
  ami           = "ami-04505e74c0741db8d"
  instance_type = "t2.micro"

  tags = {
    Name = "MyServer"
  }
}

# addin a VPC (virtual private cloud) using the provider module in terraform aws module section 
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}