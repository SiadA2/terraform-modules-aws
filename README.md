# terraform-modules-aws

A collection of reusable Terraform modules for AWS infrastructure components.

## Modules

### VPC

Creates a VPC with public and private subnets across multiple availability zones.

```hcl
module "vpc" {
  source = "./vpc"

  vpc_cidr             = "10.0.0.0/16"
  availability_zones   = ["us-east-1a", "us-east-1b", "us-east-1c"]
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnet_cidrs = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  endpoint_security_grp_id = "sg-12345678"
}
```

### Security Groups

Creates security groups for load balancer and ECS tasks.

```hcl
module "security_groups" {
  source = "./security-grps"

  vpc_id    = module.vpc.vpc_id
  app_port  = 80

  lb_security_group_name  = "my-app-lb-sg"
  lb_security_group_desc  = "Security group for ALB"
  ecs_security_group_name = "my-app-ecs-sg"
  ecs_security_group_desc = "Security group for ECS tasks"
}
```

### ACM Certificate

Requests an ACM certificate and validates it using DNS.

```hcl
module "acm" {
  source = "./acm"

  domain_name     = "example.com"
  validation_method = "DNS"
  hosted_zone_id  = "Z123456789"
}
```

### ALB

Creates an Application Load Balancer.

```hcl
module "alb" {
  source = "./alb"

  alb_name          = "my-app-alb"
  security_groups   = [module.security_groups.lb_security_group_id]
  public_subnets_id = module.vpc.public_subnet_ids
}
```

### ECR

Creates an Elastic Container Registry repository.

```hcl
module "ecr" {
  source = "./ecr"

  repo_name = "my-app-repo"
}
```

### EKS

Creates an Amazon EKS cluster with a managed node group.

```hcl
module "eks" {
  source = "./eks"

  cluster_name                    = "my-cluster"
  kubernetes_version              = "1.33"
  vpc_id                          = module.vpc.vpc_id
  subnet_ids                      = module.vpc.private_subnet_ids
  control_plane_subnet_ids        = module.vpc.private_subnet_ids
  instance_types                  = ["t3.medium"]
  min_size                        = 1
  max_size                        = 3
  desired_size                    = 2
  load_balancer_security_group_id = module.vpc.load_balancer_security_group_id
}
```

### IAM

Creates a reusable IAM role and optional instance profile.

### Redis

Creates an ElastiCache Serverless Redis deployment.

### Secrets

Creates an AWS Secrets Manager secret, version, and optional rotation.

### EC2

Creates a single EC2 instance.

### SQS

Placeholder for an SQS module.

### ECS Fargate

Creates an ECS cluster with Fargate tasks.

```hcl
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

### Route 53

Creates a Route 53 hosted zone.

```hcl
module "route53" {
  source = "./route-53"

  domain_name = "example.com"
}
```

### S3

Creates an S3 bucket.

```hcl
module "s3" {
  source = "./s3"

  bucket_name = "my-app-bucket"
}
```

### CloudFront

Creates a CloudFront distribution.

```hcl
module "cloudfront" {
  source = "./cloudfront"

  origin_domain_name     = "my-app-backend.example.com"
  origin_id              = "api-origin"
  origin_protocol_policy = "https-only"
  default_root_object    = "index.html"
  price_class            = "PriceClass_100"
  aliases                = ["www.example.com"]
  certificate_arn        = module.acm.certificate_arn
  logging_bucket         = module.s3.bucket_name
  comment                = "CF distribution for example app"
  enabled                = true
}
```
