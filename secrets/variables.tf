variable "name_prefix" {
  type = string
}

variable "description" {
  type    = string
  default = null
}

variable "recovery_window_in_days" {
  type    = number
  default = 7
}

variable "secret_values" {
  type = map(string)
}

variable "enable_rotation" {
  type    = bool
  default = true
}

variable "rotation_lambda_arn" {
  type    = string
  default = null
}

variable "rotation_schedule_expression" {
  type    = string
  default = "rate(30 days)"
}

variable "create_policy" {
  type    = bool
  default = false
}

variable "policy_statements" {
  type    = any
  default = {}
}

variable "default_tags" {
  type    = map(string)
  default = {}
}

variable "tags" {
  type    = map(string)
  default = {}
}
