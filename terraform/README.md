# Requirements

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.42.0 |

## Resources

| Name | Type |
|------|------|
| [aws_instance.web](https://registry.terraform.io/providers/hashicorp/aws/3.42.0/docs/resources/instance) | resource |
| [aws_security_group.allow_http](https://registry.terraform.io/providers/hashicorp/aws/3.42.0/docs/resources/security_group) | resource |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/3.42.0/docs/data-sources/ami) | data source |
| [aws_vpc.default](https://registry.terraform.io/providers/hashicorp/aws/3.42.0/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | The AWS region to create things in. | `string` | `"us-east-2"` | no |
| <a name="input_vpc_cidr_block"></a> [vpc\_cidr\_block](#input\_vpc\_cidr\_block) | Range of IPv4 address for the VPC. | `string` | `"172.17.0.0/16"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns_adress"></a> [dns\_adress](#output\_dns\_adress) | n/a |
| <a name="output_ip_adress"></a> [ip\_adress](#output\_ip\_adress) | n/a |
