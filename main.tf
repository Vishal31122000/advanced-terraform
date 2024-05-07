# PROVIDER
provider "aws" {
  region = "us-east-2"
}

# NETWORK
resource "aws_vpc" "default" {
  cidr_block = "10.0.0.0/16"
}

# SUBNET
resource "aws_subnet" "subnet-1" {
  vpc_id            = aws_vpc.default.id
  cidr_block        = "10.0.1.0/24"  # Adjusted subnet CIDR block
  availability_zone = "us-east-2a"
}

# SECURITY GROUP
resource "aws_security_group" "sg-01" {
  name        = "test-firewall"
  description = "Test Security Group"
  vpc_id      = aws_vpc.default.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 1000
    to_port     = 2000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = -1
    to_port     = -1
  }
}


# COMPUTE
# NGINX PROXY
resource "aws_instance" "nginx_instance" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  tags = {
    Name = "nginx-proxy"
    web  = "true"
  }

  subnet_id = aws_subnet.subnet-1.id
}

# WEB1
resource "aws_instance" "web1" {
  ami           = "ami-09040d770ffe2224f"
  instance_type = "t2.micro"
  tags = {
    Name = "web1"
  }

  subnet_id = aws_subnet.subnet-1.id
}

# WEB2
resource "aws_instance" "web2" {
  ami           = "ami-09040d770ffe2224f"
  instance_type = "t2.micro"
  tags = {
    Name = "web2"
  }

  subnet_id = aws_subnet.subnet-1.id
}

# WEB3
resource "aws_instance" "web3" {
  ami           = "ami-09040d770ffe2224f"
  instance_type = "t2.micro"
  tags = {
    Name = "web3"
  }

  subnet_id = aws_subnet.subnet-1.id
}

# DB
resource "aws_instance" "mysqldb" {
  ami           = "ami-09040d770ffe2224f"
  instance_type = "t2.micro"
  tags = {
    Name = "mysqldb"
  }

  subnet_id = aws_subnet.subnet-1.id
}