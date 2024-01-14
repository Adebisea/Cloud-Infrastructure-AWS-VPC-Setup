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

# VPC
resource "aws_vpc" "vpc" {
  cidr_block            = "10.0.0.0/16"
  enable_dns_hostnames  = true

  tags   = {
    Name = "dev_vpc"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "dev_vpc"
  }
}

# Route tables
resource "aws_route_table" "vpc_routes" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "10.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags   = {
    Name = "dev_vpc"
  }
}


# Associate route table with subnets
resource "aws_route_table_association" "pub1_subnet_route" {
  subnet_id      = aws_subnet.pub1_subnet.id
  route_table_id = aws_route_table.vpc_routes.id
}

resource "aws_route_table_association" "pub2_subnet_route" {
  subnet_id      = aws_subnet.pub2_subnet.id
  route_table_id = aws_route_table.vpc_routes.id
}

resource "aws_route_table_association" "pub3_subnet_route" {
  subnet_id      = aws_subnet.pub3_subnet.id
  route_table_id = aws_route_table.vpc_routes.id
}


# List availability zones in region
data "aws_availability_zones" "az_list" {
  state = "available"
}

# subnets
resource "aws_subnet" "pub1_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = data.aws_availability_zones.az_list.names[0]

  tags   = {
    Name = "dev_vpc"
  }
}

resource "aws_subnet" "pub2_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = data.aws_availability_zones.az_list.names[1]

  tags   = {
    Name = "dev_vpc"
  }
}

resource "aws_subnet" "pub3_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = data.aws_availability_zones.az_list.names[2]

  tags   = {
    Name = "dev_vpc"
  }
}

resource "aws_subnet" "prv1_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = data.aws_availability_zones.az_list.names[0]

  tags   = {
    Name = "dev_vpc"
  }
}

resource "aws_subnet" "prv2_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = data.aws_availability_zones.az_list.names[1]

  tags   = {
    Name = "dev_vpc"
  }
}

resource "aws_subnet" "prv3_subnet" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.6.0/24"
  availability_zone = data.aws_availability_zones.az_list.names[2]

  tags   = {
    Name = "dev_vpc"
  }
}