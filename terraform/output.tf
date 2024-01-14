output "availability_zones" {
    value = data.aws_availability_zones.az_list.names
}

output "eip_id" {
  value = aws_eip.eip.id
}