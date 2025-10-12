provider "aws" {
  region = "ap-south-1"   # Mumbai
}


module "vpc" {
  source = "./modules/vpc"

  vpc_cidr      = var.vpc_cidr
  public1_cidr  = var.public1_cidr
  public2_cidr  = var.public2_cidr
  private1_cidr = var.private1_cidr
  private2_cidr = var.private2_cidr
}

module "frontend" {
  source        = "./modules/frontend"
  
  vpc_id        = module.vpc.vpc_id
  subnet_id     = module.vpc.public1_id
  ami_id        = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
}

module "backend" {
  source        = "./modules/backend"
  
  vpc_id        = module.vpc.vpc_id
  subnet_id     = module.vpc.public2_id
  ami_id        = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
}

module "rds" {
  source        = "./modules/rds"
  
  vpc_id        = module.vpc.vpc_id
  private1_id   = module.vpc.private1_id
  private2_id   = module.vpc.private2_id
  backend_sg_id = module.backend.sg_id
  db_identifier = var.db_identifier
  db_username   = var.db_username
  db_password   = var.db_password
  db_az         = var.db_az
}

