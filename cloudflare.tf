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
  type    = "TXT"
  value   = aws_ses_domain_identity.this.verification_token
}

resource "cloudflare_record" "ses_dkim_verification" {
  for_each = toset(aws_ses_domain_dkim.this.dkim_tokens)

  zone_id = data.cloudflare_zones.this.zones[0].id
  name    = "${each.value}._domainkey.${var.domain_name}"
  type    = "CNAME"
  value   = "${each.value}.dkim.amazonses.com"
}

resource "cloudflare_record" "ses_mailfrom_mx_verification" {
  zone_id  = data.cloudflare_zones.this.zones[0].id
  name     = aws_ses_domain_mail_from.this.mail_from_domain
  type     = "MX"
  priority = 10
  value    = "feedback-smtp.${var.ses_region}.amazonses.com"
}

resource "cloudflare_record" "ses_mailfrom_spf_verification" {
  zone_id = data.cloudflare_zones.this.zones[0].id
  name    = aws_ses_domain_mail_from.this.mail_from_domain
  type    = "TXT"
  value   = "v=spf1 include:amazonses.com -all"
}
