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

# ---------------------------------------------------------------

output "bucket_name" {
  value = aws_s3_bucket.luke_s3_bucket.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.luke_s3_bucket.arn
}

output "bucket_domain" {
  value = aws_s3_bucket.luke_s3_bucket.bucket_domain_name
}

output "bucket_region" {
  value = aws_s3_bucket.luke_s3_bucket.region
}

