variable "iam_user_name" {}
variable "iam_user_path" {}
variable "iam_user_tag" {}
variable "iam_policy_document_effect" {}
variable "iam_policy_document_actions" {
  type = list(string)
}
variable "iam_policy_document_resources" {
  type = list(string)
}
variable "iam_user_policy_name" {}


