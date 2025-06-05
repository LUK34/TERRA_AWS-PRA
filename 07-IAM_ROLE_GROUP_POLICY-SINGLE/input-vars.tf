# ---------------------------------------------------
# IAM GROUP

variable "iam_group_name" {}
variable "iam_group_path" {}

# ---------------------------------------------------
# IAM ROLE Variables

variable "iam_role_name" {}
variable "iam_role_version" {}
variable "iam_role_action" {}
variable "iam_role_effect" {}
variable "iam_role_service" {}
variable "iam_role_tag" {}

# ---------------------------------------------------
# IAM POLICY Variables

variable "iam_policy_name" {}
variable "iam_policy_path" {}
variable "iam_policy_description" {}
variable "iam_policy_version" {}
variable "iam_policy_action" {
  type = list(string)
}
variable "iam_policy_effect" {}
variable "iam_policy_resource" {}

# ---------------------------------------------------
