output "bucket_name" {
  value = { for k, inst in aws_s3_bucket.luke_s3_bucket : k => inst.bucket }
}

output "bucket_arn" {
  value = { for k, inst in aws_s3_bucket.luke_s3_bucket : k => inst.arn }
}

output "bucket_domain" {
  value = { for k, inst in aws_s3_bucket.luke_s3_bucket : k => inst.bucket_domain_name }
}

output "bucket_region" {
  value = { for k, inst in aws_s3_bucket.luke_s3_bucket : k => inst.region }

}

