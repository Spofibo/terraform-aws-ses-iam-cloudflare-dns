variable "name_prefix" {
  description = "Name prefix"
  type        = string
}

variable "domain_name" {
  description = "Domain name"
  type        = string
}

variable "email_identity" {
  description = "AWS Email identity"
  type        = string
  default     = ""
}

variable "ses_region" {
  description = ""
  type        = string
}

variable "cf_api_token" {
  description = "Cloudflare API Token"
  type        = string
}
