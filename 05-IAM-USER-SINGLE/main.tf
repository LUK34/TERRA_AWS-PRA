resource "aws_iam_user" "lrm" {
  name = var.iam_user_name
  path = var.iam_user_path

  tags = {
    tag-key = var.iam_user_tag
  }
}

resource "aws_iam_access_key" "lrm" {
  user = aws_iam_user.lrm.name
}

data "aws_iam_policy_document" "lrm_ro" {
  statement {
    effect    = var.iam_policy_document_effect
    actions   = var.iam_policy_document_actions
    resources = var.iam_policy_document_resources
  }
}

resource "aws_iam_user_policy" "lrm_ro" {
  name   = var.iam_user_policy_name
  user   = aws_iam_user.lrm.name
  policy = data.aws_iam_policy_document.lrm_ro.json
}
