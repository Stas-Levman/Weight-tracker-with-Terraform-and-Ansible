<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_http"></a> [http](#provider\_http) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_network_security_group.private-nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_group.public-nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [http_http.user-IP](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | The location of the resource. | `string` | n/a | yes |
| <a name="input_private-nsg-name"></a> [private-nsg-name](#input\_private-nsg-name) | n/a | `string` | n/a | yes |
| <a name="input_public-nsg-name"></a> [public-nsg-name](#input\_public-nsg-name) | n/a | `string` | n/a | yes |
| <a name="input_rg-name"></a> [rg-name](#input\_rg-name) | The name of the resource group the resource will be deployed to. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_private-scg-id"></a> [private-scg-id](#output\_private-scg-id) | n/a |
| <a name="output_public-scg-id"></a> [public-scg-id](#output\_public-scg-id) | n/a |
<!-- END_TF_DOCS -->