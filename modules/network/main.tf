resource "aws_vpc" "vpc"{
    cidr_block = var.vpc_cidr
    enable_dns_support   = true
    enable_dns_hostnames = true

    tags = {
      Name = "${var.project}-${var.env}-vpc"
      Environment = var.env
      Project = var.project
    }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.project}-${var.env}-igw"
    Environment = var.env
    Project = var.project
  }

}

resource "aws_subnet" "dev_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.dev_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone = var.dev_az

  tags = {
    Name = "${var.project}-dev-subnet"
    Environment = var.env
  }
}
resource "aws_subnet" "stg_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.stg_subnet_cidr
  map_public_ip_on_launch = true

  availability_zone = var.stg_az

   tags = {
    Name = "${var.project}-stg-subnet"
    Environment = var.env
  }
  }
resource "aws_subnet" "prd_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.prd_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone = var.prd_az

   tags = {
    Name = "${var.project}-prd-subnet"
    Environment = var.env
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

   tags = {
    Name = "${var.project}-public-route-table"
    Environment = var.env
  }
}

resource "aws_route_table_association" "dev_rt" {
    subnet_id = aws_subnet.dev_subnet.id
    route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "stg_rt" {
    subnet_id = aws_subnet.stg_subnet.id
    route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "prd_rt" {
    subnet_id = aws_subnet.prd_subnet.id
    route_table_id = aws_route_table.rt.id
}


