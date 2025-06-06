resource "aws_instance" "vm1" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.keypair
  security_groups = ["default"]
  tags = {
    Name = "Linux-VM-2"
  }
}
