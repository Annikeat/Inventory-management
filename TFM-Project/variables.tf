# VPC
variable "vpc_cidr" {}
variable "public1_cidr" {}
variable "public2_cidr" {}
variable "private1_cidr" {}
variable "private2_cidr" {}

# EC2
variable "ami_id" {
    type = string
    default = "ami-02d26659fd82cf299"
}
variable "instance_type" {
    type = string
    default = "t2.micro"
}
variable "key_name" {}

# RDS
variable "db_identifier" {}
variable "db_username" {}
variable "db_password" {}
variable "db_az" {}
