output "ec2_instance_id" {
  value = aws_instance.lrm_v1.id
}

output "ec2_public_ip" {
  value = aws_instance.lrm_v1.public_ip
}

output "ec2_private_ip" {
  value = aws_instance.lrm_v1.private_ip
}

output "ec2_availability_zone" {
  value = aws_instance.lrm_v1.availability_zone
}

