output "cloudfront_distribution_id" {
  description = "CloudFront distribution ID"
  value       = aws_cloudfront_distribution.main.id
}

output "cloudfront_distribution_domain_name" {
  description = "CloudFront distribution domain name"
  value       = aws_cloudfront_distribution.main.domain_name
}

output "cloudfront_hosted_zone_id" {
  description = "CloudFront hosted zone ID for alias records"
  value       = aws_cloudfront_distribution.main.hosted_zone_id
}

output "origin_domain_name" {
  description = "CloudFront origin domain name"
  value       = var.origin_domain_name
}