output "ec2_public_ip" {
  value = module.my_ec2.ec2_public_ip
}

output "ec2_private_ip" {
  value = module.my_ec2.ec2_private_ip
}

output "ec2_instance_id" {
  value = module.my_ec2.ec2_instance_id
}

output "ec2_availability_zone" {
  value = module.my_ec2.ec2_availability_zone
}

output "s3_bucket_name" {
  value = module.my_s3.bucket_name
}


output "s3_bucket_domain" {
  value = module.my_s3.bucket_domain
}

output "s3_bucket_arn" {
  value = module.my_s3.bucket_arn
}

output "s3_bucket_region" {
  value = module.my_s3.bucket_region
}
