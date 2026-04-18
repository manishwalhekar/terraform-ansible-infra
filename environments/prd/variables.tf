variable "project" {
  description = "Project name"
  type        = string
}

variable "env" {

  type        = string
  description = "this is environment variable"
}

variable "instance_count" {
  type = number
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "pub_key_path" {
  type = string
}