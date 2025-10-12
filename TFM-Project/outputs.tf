# Frontend/Backend subnets from VPC
output "public1_subnet_id" {
  value = module.vpc.public1_id
}

output "public2_subnet_id" {
  value = module.vpc.public2_id
}

output "private1_subnet_id" {
  value = module.vpc.private1_id
}

output "private2_subnet_id" {
  value = module.vpc.private2_id
}

# RDS endpoint
output "rds_endpoint" {
  value = module.rds.endpoint
}
