variable "vpc_id" {}
variable "private1_id" {}
variable "private2_id" {}
variable "backend_sg_id" {}

variable "db_identifier" {
  default = "mydb10"
}

variable "db_username" {
  default = "admin"
}

variable "db_password" {
  default = "admin#123456"
}

variable "db_az" {
  default = "ap-south-1a"
}
