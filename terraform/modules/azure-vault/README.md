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
| [azurerm_key_vault.azure-vault](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault) | data source |
| [azurerm_key_vault_secret.cookie-encrypt-pwd](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) | data source |
| [azurerm_key_vault_secret.okta-API-token](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) | data source |
| [azurerm_key_vault_secret.okta-client-secret](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) | data source |
| [azurerm_key_vault_secret.vm-password](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) | data source |
| [azurerm_key_vault_secret.weight-tacker-PSQL-password](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/key_vault_secret) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure-vault-name"></a> [azure-vault-name](#input\_azure-vault-name) | Azure vault name | `string` | n/a | yes |
| <a name="input_azure-vault-resource-group"></a> [azure-vault-resource-group](#input\_azure-vault-resource-group) | Azure vault resource group | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cookie-encrypt-pwd"></a> [cookie-encrypt-pwd](#output\_cookie-encrypt-pwd) | n/a |
| <a name="output_okta-API-token"></a> [okta-API-token](#output\_okta-API-token) | n/a |
| <a name="output_okta-client-secret"></a> [okta-client-secret](#output\_okta-client-secret) | n/a |
| <a name="output_vm-password"></a> [vm-password](#output\_vm-password) | n/a |
| <a name="output_weight-tracker-PSQL-password"></a> [weight-tracker-PSQL-password](#output\_weight-tracker-PSQL-password) | n/a |
<!-- END_TF_DOCS -->