variable "vpc_cidr" {
}

variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones to create subnets in"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks for public subnets, one per availability zone"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks for private subnets, one per availability zone"
}