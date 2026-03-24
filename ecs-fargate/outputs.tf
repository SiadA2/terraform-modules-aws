output "cluster_name" {
  description = "Name of the ECS cluster"
  value       = aws_ecs_cluster.foo.name
}

output "cluster_arn" {
  description = "ARN of the ECS cluster"
  value       = aws_ecs_cluster.foo.arn
}

output "task_definition_arn" {
  description = "ARN of the ECS task definition"
  value       = aws_ecs_task_definition.service.arn
}
