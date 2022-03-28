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
| [azurerm_postgresql_flexible_server.weight-tracker-postgresql-db](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server) | resource |
| [azurerm_postgresql_flexible_server_configuration.psql-set-certification-off](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/postgresql_flexible_server_configuration) | resource |
| [azurerm_private_dns_zone.weight-tracker-postgresql-db-private-dns-zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone) | resource |
| [azurerm_private_dns_zone_virtual_network_link.postgresql-dns-to-vnet-link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | The location of the resource. | `string` | n/a | yes |
| <a name="input_postgresql-db-password"></a> [postgresql-db-password](#input\_postgresql-db-password) | The password that will be used for the application database | `string` | n/a | yes |
| <a name="input_private-subnet-id"></a> [private-subnet-id](#input\_private-subnet-id) | Id of the private subnet | `string` | n/a | yes |
| <a name="input_rg-name"></a> [rg-name](#input\_rg-name) | The name of the resource group the resource will be deployed to. | `string` | n/a | yes |
| <a name="input_vnet-id"></a> [vnet-id](#input\_vnet-id) | Id of the virtual network | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_psql-fqdn"></a> [psql-fqdn](#output\_psql-fqdn) | n/a |
<!-- END_TF_DOCS -->