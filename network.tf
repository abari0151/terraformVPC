resource "aws_internet_gateway" "terra-igw" {
  vpc_id = aws_vpc.terra-vpc.id

  tags = {
    "Name" = "terra-igw"
  }
}

resource "aws_route_table" "public-rt" {
    
  vpc_id = aws_vpc.terra-vpc.id

  route {
    cidr_block = "0.0.0.0/0"

    gateway_id = aws_internet_gateway.terra-igw.id
  }

  tags = {
    "Name" = "public-rt"
  }
  
}

resource "aws_route_table_association" "public-rta-pub-sub-1" {
  subnet_id = aws_subnet.sub-pub-1.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "public-rta-pub-sub-2" {
  subnet_id = aws_subnet.sub-pub-2.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_eip" "nat_gateway" {
  vpc      = true
}

resource "aws_nat_gateway" "terra-nat-gw" {
  allocation_id = aws_eip.nat_gateway.id
  subnet_id     = aws_subnet.sub-pub-1.id

  tags = {
    Name = "terra-nat-gw"
  }
}


resource "aws_route_table" "private-rt" {
    
  vpc_id = aws_vpc.terra-vpc.id

  route {
    cidr_block = "0.0.0.0/0"

    gateway_id = aws_nat_gateway.terra-nat-gw.id
  }

  tags = {
    "Name" = "private-rt"
  }
  
}

resource "aws_route_table_association" "private-rta-priv-sub-1" {
  subnet_id = aws_subnet.sub-priv-1.id
  route_table_id = aws_route_table.private-rt.id
}