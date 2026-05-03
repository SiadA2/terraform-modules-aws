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

# ALB security Group
resource "aws_security_group" "lb" {
  name        = var.lb_security_group_name
  description = var.lb_security_group_desc
  vpc_id      = var.vpc_id

  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

