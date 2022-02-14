# Terraform module for Mailster Wordpress plugin on AWS
Terraform module which creates an IAM user and its proper policy to access SES for Mailster plugin on WordPress

## Usage

```terraform
module "mysite_mailster" {
  source = "github.com/Spofibo/terraform-aws-wordpress-mailster"

  name_prefix              = "mysite.com"
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

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Name prefix | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
