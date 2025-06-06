output "vm1_public_ip_addr" {
  value = aws_instance.vm1.public_ip
}

output "vm1_private_ip_addr" {
  value = aws_instance.vm1.private_ip
}

output "vm1_subnet_id" {
  value = aws_instance.vm1.subnet_id
}

output "vm1_complete_info" {
  value = aws_instance.vm1
}
