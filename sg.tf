resource "aws_security_group" "public-ec2" {
    vpc_id = aws_vpc.demo-vpc.id

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "SSH allowed"
      from_port = 22
      to_port = 22
      protocol = "tcp"
    }
    
    ingress {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "HTTP allowed"
      from_port = 80
      to_port = 80
      protocol = "tcp"
    }

    ingress {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "Port 5001 for docker allowed"
      from_port = 5001
      to_port = 5001
      protocol = "tcp"
    }

    ingress {
      cidr_blocks = [ "10.0.2.0/24" ]
      description = "Traffic from private subnet"
      from_port = 0
      to_port = 65535
      protocol = "tcp"
    }

    tags = {
      "Name" = "public-ec2"
    }
  
}

resource "aws_security_group" "private-ec2" {
    vpc_id = aws_vpc.demo-vpc.id

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
      cidr_blocks = [ "10.1.0.0/24", "10.0.3.0/24" ]
      description = "Traffic from public subnets"
      from_port = 0
      to_port = 65535
      protocol = "tcp"
    }

    tags = {
      "Name" = "private-ec2"
    }
  
}






resource "aws_security_group" "alb-sg" {
    vpc_id = aws_vpc.demo-vpc.id

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "SSH allowed"
      from_port = 22
      to_port = 22
      protocol = "tcp"
    }
    
    ingress {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "HTTP allowed"
      from_port = 80
      to_port = 80
      protocol = "tcp"
    }

    ingress {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "Port 5001 for docker allowed"
      from_port = 5001
      to_port = 5001
      protocol = "tcp"
    }

    tags = {
      "Name" = "alb-sg"
    }
  
}