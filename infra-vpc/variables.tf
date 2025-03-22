variable "aws_region" {
  description = "Région AWS"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  description = "CIDR du VPC (plage IP privée)"
  type        = string
  default     = "10.0.0.0/16"
}
variable "public_subnet_cidr" {
  description = "CIDR pour le subnet public"
  type        = string
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  description = "Zone de disponibilité pour le subnet"
  type        = string
  default     = "us-east-1a"
}
