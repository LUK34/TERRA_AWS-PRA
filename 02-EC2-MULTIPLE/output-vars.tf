output "ec2_instance_ids" {
  value = { for k, inst in aws_instance.lrm_v1 : k => inst.id }
}

output "ec2_public_ips" {
  value = { for k, inst in aws_instance.lrm_v1 : k => inst.public_ip }
}

output "ec2_private_ips" {
  value = { for k, inst in aws_instance.lrm_v1 : k => inst.private_ip }
}

output "ec2_availability_zones" {
  value = { for k, inst in aws_instance.lrm_v1 : k => inst.availability_zone }
}
