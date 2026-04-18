data "aws_ami" "ubuntu" {
  most_recent = true
  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "ec2" {
    count = var.instance_count
    ami = data.aws_ami.ubuntu.id
    instance_type = var.instance_type
    key_name =  "${var.env}-${var.key_name}"
    subnet_id = var.subnet_id
    vpc_security_group_ids = [var.security_group_id]

    tags = {
    Name        = "${var.project}-${var.env}-instance-${count.index + 1}"
    Project     = var.project
    Environment = var.env
  }
}

resource "aws_key_pair" "deployer" {
    public_key = file("${path.root}/${var.pub_key_path}")
    key_name = "${var.env}-${var.key_name}"
}


