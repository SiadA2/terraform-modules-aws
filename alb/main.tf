# Create alb
resource "aws_alb" "main" {
  name            = var.alb_name
  subnets         = var.public_subnets_id
  security_groups = var.security_groups
}

# Forward HTTPS traffic to the target group
resource "aws_alb_listener" "https" {
  load_balancer_arn = aws_alb.main.arn
  port              = 443
  protocol          = "HTTPS"
  certificate_arn   = ""

  default_action {
    target_group_arn = aws_alb_target_group.app.arn
    type             = "forward"
  }
}

# Forward HTTP traffic to the target group
resource "aws_alb_listener" "http" {
  load_balancer_arn = aws_alb.main.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.app.arn
    type             = "forward"
  }
}