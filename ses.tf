resource "aws_ses_domain_identity" "this" {
  domain = var.domain_name
}

resource "aws_ses_domain_mail_from" "this" {
  domain                 = aws_ses_domain_identity.this.domain
  mail_from_domain       = "bounce.${aws_ses_domain_identity.this.domain}"
  behavior_on_mx_failure = "RejectMessage"
}

resource "aws_ses_domain_identity_verification" "this" {
  domain     = aws_ses_domain_identity.this.id
  depends_on = [cloudflare_record.ses_txt_verification]
}

resource "aws_ses_domain_dkim" "this" {
  domain = aws_ses_domain_identity.this.domain
}

resource "aws_ses_email_identity" "this" {
  count = length(var.email_identity) > 0 ? 1 : 0
  email = var.email_identity
}
