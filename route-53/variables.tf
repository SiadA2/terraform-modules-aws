variable "domain_name" {
  type        = string
  description = "The domain name for the Route 53 hosted zone"
}

variable "domain_name" {
  type        = string
  description = "Domain name of the Route 53 hosted zone"
}

variable "validation_method" {
  type        = string
  description = "How the ACM validates your domain"
  default     = "DNS"
}

variable "hosted_zone_id" {
  type        = string
  description = "ID of the Route 53 hosted zone"
}