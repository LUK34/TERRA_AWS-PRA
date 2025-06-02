resource "aws_instance" "lrm_v1" {
  ami             = var.ec2_ami_id
  instance_type   = var.ec2_instance_type
  key_name        = var.ec2_key_name
  security_groups = var.ec2_security_groups

  for_each = toset(var.ec2_name_values)
  tags = {
    Name = "${var.ec2_tags_name}${each.key}"
  }
}
