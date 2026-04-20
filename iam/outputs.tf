output "role_name" {
  description = "IAM role name"
  value       = aws_iam_role.this.name
}

output "role_arn" {
  description = "IAM role ARN"
  value       = aws_iam_role.this.arn
}

output "role_id" {
  description = "IAM role ID"
  value       = aws_iam_role.this.id
}

output "instance_profile_name" {
  description = "IAM instance profile name"
  value       = try(aws_iam_instance_profile.this[0].name, null)
}

output "instance_profile_arn" {
  description = "IAM instance profile ARN"
  value       = try(aws_iam_instance_profile.this[0].arn, null)
}
