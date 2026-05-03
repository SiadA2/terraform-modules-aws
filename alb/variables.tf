variable "alb_name" {
  type        = string
  description = "Name of the Application Load Balancer"
  default     = "test-alb"
}

variable "security_groups" {
  type        = list(string)
  description = "Security group(s) of the Application Load Balancer"
}

variable "public_subnets_id" {
  type        = list(string)
  description = "List of public subnet IDs for the Application Load Balancer"
}

variable "lb_security_group_name" {
  type    = string
  default = "cb-load-balancer-security-group"
}

variable "lb_security_group_desc" {
  type    = string
  default = "controls access to the ALB"
}

variable "vpc_id" {
}
