variable "name" {
  description = "Base name for Redis"
  type        = string
}

variable "environment" {
  description = "Environment (dev, staging, prod)"
  type        = string

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod."
  }
}

variable "max_storage_gb" {
  description = "Maximum data storage in GB"
  type        = number
}

variable "max_ecpu_per_second" {
  description = "Maximum ECPU per second"
  type        = number
}

variable "snapshot_retention_days" {
  description = "Snapshot retention in days"
  type        = number

  validation {
    condition     = !(var.environment == "prod" && var.snapshot_retention_days < 7)
    error_message = "Prod must have at least 7 days of snapshot retention."
  }
}

variable "snapshot_time" {
  description = "Daily snapshot time (UTC)"
  type        = string
  default     = "22:00"
}

variable "subnet_ids" {
  description = "Private subnet IDs"
  type        = list(string)
}

variable "security_group_ids" {
  description = "Security groups for Redis"
  type        = list(string)
}

variable "kms_key_id" {
  description = "KMS key ARN for encryption"
  type        = string
}

variable "user_group_id" {
  description = "ElastiCache user group ID"
  type        = string
  default     = null
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}
