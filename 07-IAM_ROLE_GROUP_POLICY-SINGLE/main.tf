# -----------------------------------------------------------------
# IAM GROUP
resource "aws_iam_group" "group_set" {
  name = var.iam_group_name
  path = var.iam_group_path
}
# -----------------------------------------------------------------
# IAM ROLE
resource "aws_iam_role" "role_set" {
  name = var.iam_role_name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = var.iam_role_version
    Statement = [
      {
        Action = var.iam_role_action
        Effect = var.iam_role_effect
        Sid    = ""
        Principal = {
          Service = var.iam_role_service
        }
      },
    ]
  })

  tags = {
    tag-key = var.iam_role_tag
  }
}
# -----------------------------------------------------------------
# IAM POLICY
resource "aws_iam_policy" "policy_set" {
  name        = var.iam_policy_name
  path        = var.iam_policy_path
  description = var.iam_policy_description

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = var.iam_policy_version
    Statement = [
      {
        Action   = var.iam_policy_action
        Effect   = var.iam_policy_effect
        Resource = var.iam_policy_resource
      },
    ]
  })
}

# -----------------------------------------------------------------
