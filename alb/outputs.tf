output "alb_arn" {
  description = "ARN of the Application Load Balancer"
  value       = aws_alb.main.arn
}

output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_alb.main.dns_name
}

output "alb_zone_id" {
  description = "Zone ID of the Application Load Balancer"
  value       = aws_alb.main.zone_id
}
