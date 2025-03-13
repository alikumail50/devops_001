provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "alik_vpc" {
    cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "my_public_subnet" {
  vpc_id            = aws_vpc.alik_vpc.id
  cidr_block        = "10.0.1.0/24"
  map_public_ip_on_launch = true
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.alik_vpc.id
}

resource "aws_route_table" "public_route_table_1" {
  vpc_id = aws_vpc.alik_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "my_public_subnet_association" {
  subnet_id      = aws_subnet.my_public_subnet.id
  route_table_id = aws_route_table.public_route_table_1.id
}

resource "aws_security_group" "app_sg" {
  vpc_id = aws_vpc.alik_vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "my_app_server" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.small"
  subnet_id     = aws_subnet.my_public_subnet.id
  security_groups = [aws_security_group.app_sg.name]
}