variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "cluster_name" {
  type        = string
  description = "Optional EKS cluster name used for subnet discovery tags"
  default     = null
}

variable "azs" {
  type        = list(string)
  description = "Optional alias for availability zones"
  default     = null
}

variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones to create subnets in"
  default     = null
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks for public subnets, one per availability zone"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks for private subnets, one per availability zone"
}

variable "endpoint_security_grp_id" {
  type        = string
  description = "Security group ID for VPC endpoints"
  default     = null
}

variable "enable_nat_gateway" {
  type        = bool
  description = "Whether to create a single NAT gateway for private subnet egress"
  default     = false
}

variable "aws_region" {
  type        = string
  description = "AWS region used when creating VPC endpoints"
  default     = "eu-west-2"
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to VPC resources"
  default     = {}
}
