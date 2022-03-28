<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.7 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 2.65 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 2.99.0 |
| <a name="provider_template"></a> [template](#provider\_template) | 2.2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azure-vault"></a> [azure-vault](#module\_azure-vault) | ../modules/azure-vault | n/a |
| <a name="module_front-load-balancer"></a> [front-load-balancer](#module\_front-load-balancer) | ../modules/load-balancer | n/a |
| <a name="module_network-security-groups"></a> [network-security-groups](#module\_network-security-groups) | ../modules/network-security-groups | n/a |
| <a name="module_subnets"></a> [subnets](#module\_subnets) | ../modules/subnets | n/a |
| <a name="module_web-application-vmss"></a> [web-application-vmss](#module\_web-application-vmss) | ../modules/virtual-machine-scale-set | n/a |
| <a name="module_weight-tracker-postgresql-db"></a> [weight-tracker-postgresql-db](#module\_weight-tracker-postgresql-db) | ../modules/managed-postrgeSQL-database | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_public_ip.load-balancer-public-ip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_resource_group.resource-group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |
| [template_file.custom-data-shell-script](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_COOKIE_ENCRYPT_PWD"></a> [COOKIE\_ENCRYPT\_PWD](#input\_COOKIE\_ENCRYPT\_PWD) | Variable of sensitive data that will be used with a custom .tfvars file instead of relying on vault | `string` | `null` | no |
| <a name="input_OKTA_CLIENT_SECRET"></a> [OKTA\_CLIENT\_SECRET](#input\_OKTA\_CLIENT\_SECRET) | Variable of sensitive data that will be used with a custom .tfvars file instead of relying on vault | `string` | `null` | no |
| <a name="input_PGPASSWORD"></a> [PGPASSWORD](#input\_PGPASSWORD) | Variable of sensitive data that will be used with a custom .tfvars file instead of relying on vault | `string` | `null` | no |
| <a name="input_admin-password"></a> [admin-password](#input\_admin-password) | Variable of sensitive data that will be used with a custom .tfvars file instead of relying on vault | `string` | `null` | no |
| <a name="input_azure-vault-name"></a> [azure-vault-name](#input\_azure-vault-name) | The vault name to use for this project if enabled | `string` | `"staslevman-vault"` | no |
| <a name="input_azure-vault-rg-name"></a> [azure-vault-rg-name](#input\_azure-vault-rg-name) | The vault resource group name to use for this project if enabled | `string` | `"Vault-rg"` | no |
| <a name="input_inbound-nat-port-start"></a> [inbound-nat-port-start](#input\_inbound-nat-port-start) | The default port to start from for the application VMs SSH | `number` | `50101` | no |
| <a name="input_is-azure-vault-enabled"></a> [is-azure-vault-enabled](#input\_is-azure-vault-enabled) | Check to see if this project needs to use vault for all it's sensitive content | `bool` | `true` | no |
| <a name="input_okta-API-token"></a> [okta-API-token](#input\_okta-API-token) | Variable of sensitive data that will be used with a custom .tfvars file instead of relying on vault | `string` | `null` | no |
| <a name="input_postgresql-db-password"></a> [postgresql-db-password](#input\_postgresql-db-password) | Variable of sensitive data that will be used with a custom .tfvars file instead of relying on vault | `string` | `null` | no |
| <a name="input_vmss-maximum-instances"></a> [vmss-maximum-instances](#input\_vmss-maximum-instances) | Maximum instance count for application VM scaling | `number` | `100` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_VM-password"></a> [VM-password](#output\_VM-password) | Password of the virtual machines. |
| <a name="output_public-ip"></a> [public-ip](#output\_public-ip) | n/a |
<!-- END_TF_DOCS -->