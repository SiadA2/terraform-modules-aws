resource "aws_cloudfront_distribution" "main" {
  enabled             = var.enabled
  price_class         = var.price_class
  http_version        = "http2"
  is_ipv6_enabled     = true
  default_root_object = var.default_root_object
  comment             = var.comment

  aliases = var.aliases

  origin {
    domain_name = var.origin_domain_name
    origin_id   = var.origin_id

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = var.origin_protocol_policy
      origin_ssl_protocols   = ["TLSv1.2", "TLSv1.3"]
    }
  }

  default_cache_behavior {
    target_origin_id = var.origin_id
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    compress         = true

    cache_policy_id          = "658327ea-f89d-4fab-a63d-7e88639e58f6" # CachingOptimized
    origin_request_policy_id = "216adef6-5c7f-47e4-b989-5492eafa07d3" # AllViewer except cookies
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  dynamic "viewer_certificate" {
    for_each = length(var.aliases) > 0 && var.certificate_arn != "" ? [1] : []
    content {
      acm_certificate_arn            = var.certificate_arn
      ssl_support_method             = "sni-only"
      minimum_protocol_version       = "TLSv1.2_2021"
    }
  }

  dynamic "logging_config" {
    for_each = var.logging_bucket != "" ? [1] : []
    content {
      bucket         = var.logging_bucket
      include_cookies = false
      prefix         = "cloudfront/${var.origin_id}"
    }
  }

  tags = {
    Name = "cloudfront-${var.origin_id}"
  }
}
