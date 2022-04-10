# Terraform module for AWS SES and IAM user configuration
This terraform module creates an SES Domain Identity, an IAM user with its proper policy to interact with SES, and access keys to programmatically access it.

Example usage of this module is to enact the necessary configuration for the Mailster plugin on WordPress.

## Usage

```terraform
module "mysite_ses" {
  source = "github.com/Spofibo/terraform-aws-ses-iam"

  name_prefix = "prod-mydomain"
  domain_name = "mydomain.com"
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_access_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_access_key) | resource |
| [aws_iam_user.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user) | resource |
| [aws_iam_user_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_user_policy) | resource |
| [aws_ses_domain_identity.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_domain_identity) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Domain name | `string` | n/a | yes |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Name prefix | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_access_id"></a> [access\_id](#output\_access\_id) | n/a |
| <a name="output_access_secret"></a> [access\_secret](#output\_access\_secret) | n/a |
<!-- END_TF_DOCS -->
