variable "vpc_id" {
  type        = string
  description = "ID of the VPC where security groups will be created"
}

variable "env" {
  type        = string
  description = "Environment name (dev, stg, prd)"
}

variable "project" {
  type        = string
  description = "Project name for tagging"
}