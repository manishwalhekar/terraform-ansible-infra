output "vpc_id" {
  description = "ID of the VPC"
  value       = module.network.vpc_id
}

output "dev_subnet_id" {
  description = "ID of the dev subnet"
  value       = module.network.dev_subnet_id
}

output "stg_subnet_id" {
  value = module.network.stg_subnet_id
}

output "prd_subnet_id" {
  value = module.network.prd_subnet_id
}