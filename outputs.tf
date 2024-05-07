### OUTPUTS ###
output "subnet-gateway" {
  value = aws_subnet.subnet-1.ipv6_cidr_block_association_id
}

output "nginx-public-ip" {
  value = aws_instance.nginx_instance.public_ip
}
