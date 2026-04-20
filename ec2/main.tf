resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name
  monitoring    = var.monitoring

  tags = merge(
    {
      Name        = "monitoring-instance-${var.environment}"
      Environment = var.environment
      Terraform   = "true"
    },
    var.additional_tags
  )
}
