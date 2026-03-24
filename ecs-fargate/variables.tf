variable "cluster_name" {
  description = "name of the ecs cluster"
  default     = "default-cluster"
}

variable "volume_name" {
  description = "name of the container volume"
  default     = "container-volume"
}
variable "volume_path" {
  description = "path to the container volume"
  default     = "/ecs/service-storage"
}

variable "container_definitions" {
  type = list(object({
    name      = string
    image     = string
    cpu       = optional(number, 256)
    memory    = optional(number, 512)
    essential = optional(bool, true)
    environment = optional(list(object({
      name  = string
      value = string
    })), [])
    portMappings = optional(list(object({
      containerPort = number
      hostPort      = optional(number)
      protocol      = optional(string, "tcp")
    })), [])
    logConfiguration = optional(object({
      logDriver = string
      options   = optional(map(string), {})
    }), null)
  }))
  description = "List of container definitions for the ECS task"
  default = [
    {
      name      = "default-container"
      image     = "nginx:latest"
      cpu       = 256
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ]
}