<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_subnet.private](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.public](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet_network_security_group_association.associate-private-SCG](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |
| [azurerm_subnet_network_security_group_association.associate-public-SCG](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_private-scg-id"></a> [private-scg-id](#input\_private-scg-id) | ID of the private security group | `string` | n/a | yes |
| <a name="input_public-scg-id"></a> [public-scg-id](#input\_public-scg-id) | Id of the public security group | `string` | n/a | yes |
| <a name="input_rg-name"></a> [rg-name](#input\_rg-name) | Resource group name | `string` | n/a | yes |
| <a name="input_vnet-name"></a> [vnet-name](#input\_vnet-name) | Name of the virtual network | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private-subnet-id"></a> [private-subnet-id](#output\_private-subnet-id) | n/a |
| <a name="output_public-subnet-id"></a> [public-subnet-id](#output\_public-subnet-id) | n/a |
<!-- END_TF_DOCS -->