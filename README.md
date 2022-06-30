<!-- BEGIN_TF_DOCS -->
# Create Public, Private and Reverse DNS Records for an instance

This module allows you to quickly create public, private and reverse DNS
records for an instance.

## Examples

```hcl
resource "aws_route53_zone" "public" {
  name = "example.com"
}

resource "aws_route53_zone" "private" {
  name = "example.com"

  vpc {
    vpc_id = aws_vpc.example.id
  }
}

module "recordset" {
  source = "CogDisResLab/route53-recordset/aws"

  instance     = aws_instance.example
  private_zone = aws_route53_zone.private.id
  reverse_zone = aws_route53_zone.public.id
  domain_name  = "www.example.com"
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0, < 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0, < 5.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The domain name for the dns records | `any` | n/a | yes |
| <a name="input_instance"></a> [instance](#input\_instance) | The instance you need to generate the recordset for | `map` | `{}` | no |
| <a name="input_private_zone"></a> [private\_zone](#input\_private\_zone) | ID of the zone with the private dns records | `string` | n/a | yes |
| <a name="input_public"></a> [public](#input\_public) | Whether or not the instance is in the public subnet | `bool` | `false` | no |
| <a name="input_public_zone"></a> [public\_zone](#input\_public\_zone) | ID of the zone with the public dns records | `string` | n/a | yes |
| <a name="input_reverse_zone"></a> [reverse\_zone](#input\_reverse\_zone) | ID of the zone with the reverse dns records | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private_dns"></a> [private\_dns](#output\_private\_dns) | n/a |
| <a name="output_public_dns"></a> [public\_dns](#output\_public\_dns) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_route53_record.instance_private_dns_record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.instance_public_dns_record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.reverse_dns_record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |

## License

This project is licensed under the GNU General Public License version 3 (GPLv3).
<!-- END_TF_DOCS -->
