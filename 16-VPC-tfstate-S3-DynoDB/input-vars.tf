variable "vpc_name" {
  type    = string
  default = "demo_vpc"
}

variable "vpc_environment" {}
variable "vpc_terraform" {}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}
