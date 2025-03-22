output "vpc_id" {
  description = "ID du VPC principal"
  value       = aws_vpc.main_vpc.id
}
output "internet_gateway_id" {
  description = "ID de l'Internet Gateway"
  value       = aws_internet_gateway.main_igw.id
}
output "public_route_table_id" {
  value = aws_route_table.public_rt.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}
output "subnet_public_association" {
  value = aws_route_table_association.public_assoc.id
}
output "private_subnet_id" {
  description = "Subnet privé pour RDS"
  value       = aws_subnet.private_subnet.id
}
output "private_subnet_id_2" {
  description = "Deuxième subnet privé (AZ différente)"
  value       = aws_subnet.private_subnet_2.id
}
