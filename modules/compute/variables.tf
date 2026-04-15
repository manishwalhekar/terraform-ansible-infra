variable "instance_type" {
    type = string
    description = "this is the instance type for the ec2"
}

variable "instance_name" {

    type = string
    description = "this is the instance name for ec2 instance"
    default = "my-ec2-instance"
  
}

variable "instance_count" {
  description = "Number of EC2 instances"
  type        = number
}

variable "key_name" {

    type = string
    description = "this is key name for my ec2 keypair"
  
}

variable "pub_key_path" {
    type = string
    description = "this is path to the public key file"
    default = "~/.ssh/id_ed25519.pub"
  
}

variable "project" {
  description = "Project name"
  type        = string
}   

variable "env" {

    type = string
    description = "this is environment variable"
}