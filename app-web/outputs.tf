output "private_key_path" {
  description = "Chemin vers la clé privée pour SSH"
  value       = local_file.private_key_pem.filename
}
output "instance_public_ip" {
  description = "Adresse IP publique de l'instance EC2"
  value       = aws_instance.web.public_ip
}
output "rds_endpoint" {
  description = "Endpoint de la base PostgreSQL"
  value       = aws_db_instance.postgres.address
}
