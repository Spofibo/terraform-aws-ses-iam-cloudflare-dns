resource "aws_ses_domain_identity" "this" {
  domain = var.domain_name
}

resource "aws_iam_user" "this" {
  name = "${var.name_prefix}-mailster"
}

resource "aws_iam_access_key" "this" {
  user = aws_iam_user.this.name
}

resource "aws_iam_user_policy" "this" {
  name = "${var.name_prefix}-access-to-ses"
  user = aws_iam_user.this.name

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "ses:SendRawEmail",
          "ses:GetSendQuota",
          "ses:VerifyEmailIdentity",
          "ses:ListIdentities"
        ],
        Resource = "*",
        # Condition = {
        #   StringEquals = {
        #     "ses:FromAddress" : "marketing@example.com"
        #   }
        # }
      }
    ]
  })
}
