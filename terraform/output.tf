output "ip_adress" {
  value = aws_instance.web[*].public_ip  
}

output "dns_adress" {
  value = aws_instance.web[*].public_dns 
}
