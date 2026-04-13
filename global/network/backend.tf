terraform {
  backend "s3" {
    bucket         = "terraform-infra-state-bucket"
    key            = "global/network/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}