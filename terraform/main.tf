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


# subnets

resource "aws_subnet" "prv1_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = data.aws_availability_zones.az_list.names[0]

  tags   = {
    Name = "dev_vpc"
  }
}

resource "aws_subnet" "pub2_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = data.aws_availability_zones.az_list.names[1]

  tags   = {
    Name = "dev_vpc"
  }
}

resource "aws_subnet" "pub3_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = data.aws_availability_zones.az_list.names[2]

  tags   = {
    Name = "dev_vpc"
  }
}

resource "aws_subnet" "prv1_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = data.aws_availability_zones.az_list.names[0]

  tags   = {
    Name = "dev_vpc"
  }
}

resource "aws_subnet" "prv2_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = data.aws_availability_zones.az_list.names[1]

  tags   = {
    Name = "dev_vpc"
  }
}

resource "aws_subnet" "prv3_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.6.0/24"
  availability_zone = data.aws_availability_zones.az_list.names[2]

  tags   = {
    Name = "dev_vpc"
  }
}