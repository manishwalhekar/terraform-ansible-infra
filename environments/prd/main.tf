data "terraform_remote_state" "network" {

  backend = "s3"

  config = {
    bucket = "terra-infra-bucket-1"
    key    = "global/network/terraform.tfstate"
    region = "us-east-1"
  }
}

module "security" {

  project = var.project
  env     = var.env
  source  = "../../modules/security"
  vpc_id  = data.terraform_remote_state.network.outputs.vpc_id
}

module "compute" {

  source = "../../modules/compute"

  project = var.project
  env     = var.env

  instance_count = var.instance_count
  instance_type  = var.instance_type

  subnet_id = data.terraform_remote_state.network.outputs.prd_subnet_id
  security_group_id = module.security.sg_id

  key_name     = var.key_name
  pub_key_path = var.pub_key_path
}