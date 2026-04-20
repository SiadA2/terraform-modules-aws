module "redis_serverless" {
  source = "terraform-aws-modules/elasticache/aws//modules/serverless-cache"

  engine     = "redis"
  cache_name = "${var.name}-${var.environment}"

  description = "Redis serverless cache for ${var.environment}"

  cache_usage_limits = {
    data_storage = {
      maximum = var.max_storage_gb
    }
    ecpu_per_second = {
      maximum = var.max_ecpu_per_second
    }
  }

  daily_snapshot_time      = var.snapshot_time
  snapshot_retention_limit = var.snapshot_retention_days

  kms_key_id         = var.kms_key_id
  security_group_ids = var.security_group_ids
  subnet_ids         = var.subnet_ids

  major_engine_version = "7"
  user_group_id        = var.user_group_id

  tags = merge(
    {
      Environment = var.environment
      Terraform   = "true"
    },
    var.tags
  )
}
