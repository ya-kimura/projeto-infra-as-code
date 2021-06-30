output "ip_adress" {
  value = aws_instance.web[*].public_ip  
}