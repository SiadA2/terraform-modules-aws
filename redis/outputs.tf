output "redis_endpoint" {
  description = "Redis endpoint"
  value       = module.redis_serverless.endpoint
}

output "redis_port" {
  description = "Redis port"
  value       = module.redis_serverless.port
}

output "redis_arn" {
  description = "Redis ARN"
  value       = module.redis_serverless.arn
}
