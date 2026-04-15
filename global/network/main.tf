module "network" {
  source = "../../modules/network"


  project = var.project
  env     = var.env

  vpc_cidr        = var.vpc_cidr
  dev_subnet_cidr = var.dev_subnet_cidr
  stg_subnet_cidr = var.stg_subnet_cidr
  prd_subnet_cidr = var.prd_subnet_cidr

  dev_az = var.dev_az
  stg_az = var.stg_az
  prd_az = var.prd_az

}