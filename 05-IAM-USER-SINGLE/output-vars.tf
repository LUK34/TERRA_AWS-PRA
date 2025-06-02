output "iam_user_name" {
  value = aws_iam_user.lrm.name
}

output "iam_user_arn" {
  value = aws_iam_user.lrm.arn
}

output "access_key_id" {
  value = aws_iam_access_key.lrm.id
}

output "access_key_secret" {
  value     = aws_iam_access_key.lrm.secret
  sensitive = true
}

output "iam_policy_json" {
  value = data.aws_iam_policy_document.lrm_ro.json
}

output "user_policy_name" {
  value = aws_iam_user_policy.lrm_ro.name
}
