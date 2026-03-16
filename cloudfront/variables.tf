variable "origin_domain_name" {
  type        = string
  description = "Origin domain name for CloudFront distribution (e.g. bucket.s3.amazonaws.com or api.example.com)"
}

variable "origin_id" {
  type        = string
  description = "Origin ID used in CloudFront config"
  default     = "origin-1"
}

variable "origin_protocol_policy" {
  type        = string
  description = "Protocol CloudFront uses to connect to origin"
  default     = "https-only"
}

variable "default_root_object" {
  type        = string
  description = "Root object returned for viewer requests to the root URL"
  default     = "index.html"
}

variable "price_class" {
  type        = string
  description = "CloudFront price class"
  default     = "PriceClass_100"
}

variable "aliases" {
  type        = list(string)
  description = "CNAME alias list for CloudFront distribution"
  default     = []
}

variable "certificate_arn" {
  type        = string
  description = "ACM certificate ARN for HTTPS on custom aliases"
  default     = ""
}

variable "logging_bucket" {
  type        = string
  description = "Optional S3 bucket name for CloudFront access logging"
  default     = ""
}

variable "comment" {
  type        = string
  description = "Optional comment for CloudFront distribution"
  default     = "Managed by Terraform"
}

variable "enabled" {
  type        = bool
  description = "Whether CloudFront distribution is enabled"
  default     = true
}
