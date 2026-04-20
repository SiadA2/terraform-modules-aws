variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version"
  type        = string
  default     = "1.33"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "Worker node subnets"
  type        = list(string)
}

variable "control_plane_subnet_ids" {
  description = "Control plane subnets"
  type        = list(string)
}

variable "instance_types" {
  description = "EC2 instance types for node group"
  type        = list(string)
}

variable "min_size" {
  type = number
}

variable "max_size" {
  type = number
}

variable "desired_size" {
  type = number
}

variable "load_balancer_security_group_id" {
  description = "Security group allowed to reach EKS nodes"
  type        = string
  default     = null
}

variable "tags" {
  type    = map(string)
  default = {}
}
