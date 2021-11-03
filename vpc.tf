resource "aws_vpc" "demo-vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = "true" #gives you an internal domain name
  enable_dns_hostnames = "true"
  instance_tenancy = "default"

  tags = {
      Name = "demo-vpc"
  }
}

resource "aws_subnet" "sub-pub-1" {
    vpc_id = aws_vpc.demo-vpc.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true" //makes this public subnet
    availability_zone = "us-east-1a"

    tags = {
        Name = "sub-pub-1"
    }
}

resource "aws_subnet" "sub-priv-1" {
    vpc_id = aws_vpc.demo-vpc.id
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = "false" //makes this private subnet
    availability_zone = "us-east-1a"

    tags = {
        Name = "sub-priv-1"
    }
}

resource "aws_subnet" "sub-pub-2" {
    vpc_id = aws_vpc.demo-vpc.id
    cidr_block = "10.0.3.0/24"
    map_public_ip_on_launch = "true" //makes this public subnet
    availability_zone = "us-east-1b"

    tags = {
        Name = "sub-pub-2"
    }
}