output "iam_user_name" {
  value = { for k, user in aws_iam_user.lrm : k => user.name }
}

output "iam_user_arn" {
  value = { for k, user in aws_iam_user.lrm : k => user.arn }

}

output "access_key_id" {
  value = { for k, key in aws_iam_access_key.lrm : k => key.id }

}

output "access_key_secret" {
  value     = { for k, key in aws_iam_access_key.lrm : k => key.secret }
  sensitive = true
}

output "iam_policy_json" {
  value = data.aws_iam_policy_document.lrm_ro.json
}

output "user_policy_name" {
  value = { for k, policy in aws_iam_user_policy.lrm_ro : k => policy.name }
  //aws_iam_user_policy.lrm_ro.name

}
