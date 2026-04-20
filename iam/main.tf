data "aws_partition" "current" {}

data "aws_iam_policy_document" "assume_role" {
  dynamic "statement" {
    for_each = length(var.trusted_service_principals) > 0 ? [1] : []

    content {
      effect  = "Allow"
      actions = ["sts:AssumeRole"]

      principals {
        type        = "Service"
        identifiers = var.trusted_service_principals
      }
    }
  }

  dynamic "statement" {
    for_each = length(var.trusted_aws_principals) > 0 ? [1] : []

    content {
      effect  = "Allow"
      actions = ["sts:AssumeRole"]

      principals {
        type        = "AWS"
        identifiers = var.trusted_aws_principals
      }
    }
  }
}

resource "aws_iam_role" "this" {
  name                 = var.name
  description          = var.description
  path                 = var.path
  assume_role_policy   = data.aws_iam_policy_document.assume_role.json
  max_session_duration = var.max_session_duration

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "administrator_access" {
  role       = aws_iam_role.this.name
  policy_arn = "arn:${data.aws_partition.current.partition}:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_instance_profile" "this" {
  count = var.create_instance_profile ? 1 : 0

  name = var.instance_profile_name != null ? var.instance_profile_name : var.name
  role = aws_iam_role.this.name

  tags = var.tags
}
