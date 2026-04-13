output "vpc_id"{
    description = "ID of the VPC"
    value = aws_vpc.vpc.id
}

output "dev_subnet_id" {
  description = "ID of the dev environment subnet"
  value = aws_subnet.dev_subnet.id
}

output "stg_subnet_id" {
  description = "ID of the stg environment subnet"
  value = aws_subnet.stg_subnet.id
}

output "prd_subnet_id" {
  description = "ID of the prd environment subnet"
  value = aws_subnet.prd_subnet.id
}