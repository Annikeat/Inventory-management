variable "ami_id" {
  type        = string
  description = "AMI ID for the backend EC2"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for backend EC2"
}

variable "key_name" {
  type        = string
  description = "Key pair for SSH"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where SG will be created"
}
