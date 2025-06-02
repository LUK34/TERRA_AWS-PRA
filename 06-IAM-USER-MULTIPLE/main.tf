resource "aws_iam_user" "lrm" {
  for_each = var.iam_user_name
  name     = each.key
  path     = var.iam_user_path

  tags = {
    tag-key = each.value
  }
}

resource "aws_iam_access_key" "lrm" {
  for_each = var.iam_user_name
  user     = aws_iam_user.lrm[each.key].name
}

data "aws_iam_policy_document" "lrm_ro" {
  statement {
    effect    = var.iam_policy_document_effect
    actions   = var.iam_policy_document_actions
    resources = var.iam_policy_document_resources
  }
}

resource "aws_iam_user_policy" "lrm_ro" {
  for_each = var.iam_user_name
  name     = var.iam_user_policy_name
  user     = aws_iam_user.lrm[each.key].name
  policy   = data.aws_iam_policy_document.lrm_ro.json
}
