resource "aws_instance" "lrm_v1" {
  ami             = var.ec2_ami_id
  instance_type   = var.ec2_instance_type
  key_name        = var.ec2_key_name
  security_groups = var.ec2_security_groups
  tags = {
    Name = var.ec2_tags_name
  }
}

resource "aws_s3_bucket" "luke_s3_bucket" {
  bucket = var.s3_bucket_name

  tags = {
    Name        = var.s3_bucket_name
    Environment = var.s3_bucket_env_name
  }
}
