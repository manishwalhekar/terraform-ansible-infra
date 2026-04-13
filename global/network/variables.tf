variable "vpc_cidr" {
  type        = string
  description = "this is cidr block for VPC"
}

variable "dev_subnet_cidr" {

  type        = string
  description = "this is subnet cidr for dev enviroment subnet"
}

variable "stg_subnet_cidr" {

  type        = string
  description = "this is subnet cidr for staging enviroment subnet"
}

variable "prd_subnet_cidr" {

  type        = string
  description = "this is subnet cidr for production enviroment subnet"
}

variable "dev_az" {

  description = "this is the availability zone for dev environment"
  type        = string

}

variable "stg_az" {

  description = "this is the availability zone for stg environment"
  type        = string

}

variable "prd_az" {

  description = "this is the availability zone for prd environment"
  type        = string

}


