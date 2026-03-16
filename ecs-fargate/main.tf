resource "aws_ecs_cluster" "foo" {
  name = var.cluster_name

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_ecs_task_definition" "service" {
  family = "service"
  container_definitions = jsonencode(var.container_definitions)

  volume {
    name      = var.volume_name
    host_path = var.volume_path
  }
}