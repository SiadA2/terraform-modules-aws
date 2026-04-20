variable "name" {
  description = "IAM role name"
  type        = string
}

variable "description" {
  description = "IAM role description"
  type        = string
  default     = "Permissive IAM role for rapid development"
}

variable "path" {
  description = "IAM path for the role"
  type        = string
  default     = "/"
}

variable "max_session_duration" {
  description = "Maximum session duration in seconds"
  type        = number
  default     = 3600
}

variable "trusted_service_principals" {
  description = "AWS service principals allowed to assume this role"
  type        = list(string)
  default     = ["ec2.amazonaws.com", "pods.eks.amazonaws.com"]
}

variable "trusted_aws_principals" {
  description = "AWS principal ARNs allowed to assume this role"
  type        = list(string)
  default     = []
}

variable "create_instance_profile" {
  description = "Whether to create an instance profile for EC2 use"
  type        = bool
  default     = false
}

variable "instance_profile_name" {
  description = "Optional custom name for the instance profile"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to apply to IAM resources"
  type        = map(string)
  default     = {}
}
