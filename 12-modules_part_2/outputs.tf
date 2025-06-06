output "ec2_vm1_public_ip" {
  value = module.my_ec2.vm1_public_ip_addr
}

output "ec2_vm1_private_ip" {
  value = module.my_ec2.vm1_private_ip_addr
}

output "ec2_vm1_subnet_id" {
  value = module.my_ec2.vm1_subnet_id
}

output "ec2_vm1_complete_info" {
  value = module.my_ec2.vm1_complete_info
}

output "s3_bucket_output_info" {
  value = module.my_s3.s3_bucket_output_info
}
