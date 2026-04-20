variable "ami_id" {
  type        = string
  description = "AMI ID for the instance"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "subnet_id" {
  type = string
}

variable "key_name" {
  type = string
}

variable "monitoring" {
  type    = bool
  default = true
}

variable "environment" {
  type = string
}

variable "additional_tags" {
  type    = map(string)
  default = {}
}
