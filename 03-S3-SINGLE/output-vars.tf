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

