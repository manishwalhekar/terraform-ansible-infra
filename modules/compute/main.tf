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
    key_name = var.key_name
    vpc_security_group_ids = [aws_security_group.ec2_sg.id]

    tags = {
    Name        = "${var.project}-${var.env}-instance-${count.index + 1}"
    Project     = var.project
    Environment = var.env
  }
    
}

resource "aws_key_pair" "deployer" {
    public_key = file("terra-infra-key.pub")
    key_name = "${var.env}-${var.key_name}"
}


