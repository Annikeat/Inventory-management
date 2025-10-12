# RDS 
resource "aws_db_subnet_group" "this" {
  name       = "rds-subnet-group"
  subnet_ids = [var.private1_id, var.private2_id]

  tags = {
    Name = "rds-subnet-group"
  }
}

resource "aws_security_group" "this" {
  name        = "rds-sg"
  description = "Allow MySQL from backend"
  vpc_id      = var.vpc_id

  ingress {
    description = "MySQL from backend"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [var.backend_sg_id] # only backend SG can connect
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds-sg"
  }
}

resource "aws_db_instance" "this" {
  identifier           = var.db_identifier
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  allocated_storage    = 20
  storage_type         = "gp2"

  username             = var.db_username
  password             = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = [aws_security_group.this.id]

  skip_final_snapshot = true

  availability_zone = var.db_az   # like "ap-south-1a"

  tags = {
    Name = var.db_identifier
  }
}
