data "cloudflare_zones" "this" {
  filter {
    name        = var.domain_name
    lookup_type = "contains"
    status      = "active"
    paused      = false
  }
}

resource "cloudflare_record" "ses_txt_verification" {
  zone_id = data.cloudflare_zones.this.zones[0].id
  name    = "_amazonses.${aws_ses_domain_identity.this.domain}"
  value   = aws_ses_domain_identity.this.verification_token
  type    = "TXT"
}

resource "cloudflare_record" "ses_dkim_verification" {
  count = 3

  zone_id = data.cloudflare_zones.this.zones[0].id
  name    = "${element(aws_ses_domain_dkim.this.dkim_tokens, count.index)}._domainkey.${aws_ses_domain_identity.this.domain}"
  value   = "${element(aws_ses_domain_dkim.this.dkim_tokens, count.index)}.dkim.amazonses.com"
  type    = "CNAME"
}

resource "cloudflare_record" "ses_mailfrom_mx_verification" {
  zone_id  = data.cloudflare_zones.this.zones[0].id
  name     = aws_ses_domain_mail_from.this.mail_from_domain
  value    = "feedback-smtp.${var.ses_region}.amazonses.com"
  type     = "MX"
  priority = 10
}

resource "cloudflare_record" "ses_mailfrom_spf_verification" {
  zone_id = data.cloudflare_zones.this.zones[0].id
  name    = aws_ses_domain_mail_from.this.mail_from_domain
  value   = "v=spf1 include:amazonses.com -all"
  type    = "TXT"
}
