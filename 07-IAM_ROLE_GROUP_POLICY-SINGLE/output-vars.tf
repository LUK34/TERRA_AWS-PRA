# ----------------------------------------------
# IAM GROUP

output "iam_group_name" {
  value = aws_iam_group.group_set.name
}

output "iam_group_arn" {
  value = aws_iam_group.group_set.arn
}

output "iam_group_path" {
  value = aws_iam_group.group_set.path
}

# ----------------------------------------------
# IAM ROLE

output "iam_role_name" {
  value = aws_iam_role.role_set.name
}

output "iam_role_arn" {
  value = aws_iam_role.role_set.arn
}

output "iam_role_unique_id" {
  value = aws_iam_role.role_set.unique_id
}

output "iam_role_create_date" {
  value = aws_iam_role.role_set.create_date
}

# ----------------------------------------------
# IAM POLICY

output "iam_policy_name" {
  value = aws_iam_policy.policy_set.name
}

output "iam_policy_arn" {
  value = aws_iam_policy.policy_set.arn
}

output "iam_policy_id" {
  value = aws_iam_policy.policy_set.id
}

output "iam_policy_description" {
  value = aws_iam_policy.policy_set.description
}

# ----------------------------------------------

