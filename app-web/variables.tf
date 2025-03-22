variable "aws_region" {
  description = "La région AWS"
  type        = string
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "ID du VPC existant"
  type        = string
}

variable "subnet_id" {
  description = "ID du subnet public existant"
  type        = string
}
variable "private_subnet_id" {
  description = "ID du subnet privé pour la BDD"
  type        = string
}
variable "private_subnet_id_2" {
  description = "Deuxième subnet privé dans une autre AZ"
  type        = string
}
