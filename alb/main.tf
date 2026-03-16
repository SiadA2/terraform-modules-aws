# Create alb
resource "aws_alb" "main" {
  name            = var.alb_name
  subnets         = var.public_subnets_id
  security_groups = var.security_groups
}
