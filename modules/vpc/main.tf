resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.igw_name
  }
}

resource "aws_subnet" "public-subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidr_block  

  tags = {
    Name = var.subnet_name
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = var.route_table_name
  }
}

resource "aws_route_table_association" "public-rt" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.public.id
}


resource "aws_security_group" "aws_sg" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.sg_name
  }

}


resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.aws_sg.id
  ip_protocol = "tcp"
  from_port = 80                  
  to_port = 80                  
  cidr_ipv4 = "0.0.0.0/0"       
}


resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.aws_sg.id
  ip_protocol = "tcp"
  from_port = 443                 
  to_port = 443                 
  cidr_ipv4 = "0.0.0.0/0"       
}


resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.aws_sg.id
  ip_protocol = "tcp"
  from_port = 22                  
  to_port = 22                  
  cidr_ipv4 = "0.0.0.0/0"       
}

resource "aws_vpc_security_group_egress_rule" "egress" {
  security_group_id = aws_security_group.aws_sg.id
  ip_protocol = -1
  cidr_ipv4 = "0.0.0.0/0"
}