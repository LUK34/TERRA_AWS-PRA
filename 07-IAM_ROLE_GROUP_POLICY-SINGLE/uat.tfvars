# ----------------------------------------------
# IAM GROUP Variables

iam_group_name = "testing"
iam_group_path = "/users/"

# ----------------------------------------------
# IAM ROLE Variables

iam_role_name    = "test_role"
iam_role_version = "2012-10-17"
iam_role_action  = "sts:AssumeRole"
iam_role_effect  = "Allow"
iam_role_service = "ec2.amazonaws.com"
iam_role_tag     = "uat-tag-value"

# ----------------------------------------------
# IAM POLICY Variables

iam_policy_name        = "test_policy"
iam_policy_path        = "/"
iam_policy_description = "My test policy"
iam_policy_version     = "2012-10-17"
iam_policy_action      = ["ec2:Describe*"]
iam_policy_effect      = "Allow"
iam_policy_resource    = "*"

# ----------------------------------------------
