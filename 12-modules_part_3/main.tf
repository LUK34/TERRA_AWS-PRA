module "my_ec2" {
  source              = "./modules/ec2"
  ec2_ami_id          = var.ec2_ami_id
  ec2_name            = var.ec2_name
  ec2_instance_type   = var.ec2_instance_type
  ec2_key_name        = var.ec2_key_name
  ec2_security_groups = var.ec2_security_groups
  ec2_tags_name       = var.ec2_tags_name
}

module "my_s3" {
  source             = "./modules/s3"
  s3_bucket_name     = var.s3_bucket_name
  s3_bucket_env_name = var.s3_bucket_env_name
}
