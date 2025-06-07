output "az_list" {
  value = data.aws_availability_zones.available.names
}

output "region_name" {
  value = data.aws_region.current.name
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "vpc_cidr" {
  value = aws_vpc.vpc.cidr_block
}
