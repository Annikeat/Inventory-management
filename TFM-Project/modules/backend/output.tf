output "backend_instance_id" {
  value = aws_instance.backend.id
}

output "backend_public_ip" {
  value = aws_instance.backend.public_ip
}
output "sg_id" {
  value = aws_security_group.backend_sg.id
}
