module "my_ec2" {
  source = "./modules/ec2"
}

module "my_s3" {
  source = "./modules/s3"
}
