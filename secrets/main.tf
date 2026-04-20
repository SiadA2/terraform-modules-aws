resource "aws_secretsmanager_secret" "this" {
  name_prefix             = var.name_prefix
  description             = var.description
  recovery_window_in_days = var.recovery_window_in_days

  tags = merge(var.default_tags, var.tags)
}

resource "aws_secretsmanager_secret_version" "this" {
  secret_id     = aws_secretsmanager_secret.this.id
  secret_string = jsonencode(var.secret_values)
}

resource "aws_secretsmanager_secret_rotation" "this" {
  count = var.enable_rotation ? 1 : 0

  secret_id           = aws_secretsmanager_secret.this.id
  rotation_lambda_arn = var.rotation_lambda_arn

  rotation_rules {
    schedule_expression = var.rotation_schedule_expression
  }
}

resource "aws_secretsmanager_secret_policy" "this" {
  count = var.create_policy ? 1 : 0

  secret_arn = aws_secretsmanager_secret.this.arn
  policy     = jsonencode(var.policy_statements)
}
