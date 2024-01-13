terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "vpc" {
  cidr_block            = "10.0.0.0/16"
  enable_dns_hostnames  = true

  tags   = {
    Name = "dev_vpc"
  }
}

data "aws_availability_zones" "az_list" {
  state = "available"
}


