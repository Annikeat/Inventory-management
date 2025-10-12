# backend

# Security group for backend :

resource "aws_security_group" "backend_sg" {
  name = "backend-sg"
  description = "Allow SSH and custom app traffic for backend"
  vpc_id = var.vpc_id

  ingress {
    description = "SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # open SSH (can restrict later)
  }

  ingress {
    description = "app port"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # open app traffic (e.g backend api)
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "backend-sg"
  }   
}


# EC2 instances for Backend:

resource "aws_instance" "backend" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  key_name                    = var.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.backend_sg.id]

  tags = {
    Name = "Backend"
  }
}