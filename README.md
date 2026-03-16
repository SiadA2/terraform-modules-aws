# terraform-modules-aws

```bash 
module "vpc" {
  source = "./vpc"
  
  vpc_cidr = "10.0.0.0/16"
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnet_cidrs = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}
```

```bash
module "ecs_fargate" {
  source = "./ecs-fargate"
  
  cluster_name = "my-cluster"
  container_definitions = [
    {
      name  = "web-app"
      image = "nginx:1.21"
      cpu   = 512
      memory = 1024
      essential = true
      environment = [
        { name = "ENV", value = "production" },
        { name = "PORT", value = "8080" }
      ]
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = "/ecs/my-app"
          "awslogs-region"        = "us-east-1"
          "awslogs-stream-prefix" = "ecs"
        }
      }
    },
    {
      name  = "sidecar"
      image = "busybox:latest"
      cpu   = 128
      memory = 256
      essential = false
    }
  ]
}
```

```bash
module "cloudfront" {
  source = "../cloudfront"

  origin_domain_name        = "my-app-backend.example.com"   # flexible origin
  origin_id                 = "api-origin"
  origin_protocol_policy    = "https-only"
  default_root_object       = "index.html"
  price_class               = "PriceClass_100"
  aliases                   = ["www.example.com"]           # optional custom CNAMEs
  certificate_arn           = "arn:aws:acm:us-east-1:123456789012:certificate/abcd-ef01-2345-6789-abcd1234ef56"
  logging_bucket            = "cf-access-logs-bucket"
  comment                   = "CF distribution for example app"
  enabled                   = true
}
```