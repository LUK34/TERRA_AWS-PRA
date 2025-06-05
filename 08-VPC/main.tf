#Retrieve the list of Availability Zones in the AWS region
data "aws_availability_zones" "available" {}
data "aws_region" "current" {}


#Define the VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name        = var.vpc_name
    Environment = var.vpc_environment
    Terraform   = var.vpc_terraform
  }
}

