resource "aws_s3_bucket" "luke_s3_bucket" {
  for_each = toset(var.s3_bucket_name)
  bucket   = each.key

  tags = {
    Name        = each.key
    Environment = var.s3_bucket_env_name
  }
}

//"${var.ec2_tags_name}${each.key}"
