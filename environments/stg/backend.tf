terraform {
  backend "s3" {
    bucket         = "terra-infra-bucket-1"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}