# Weight tracker terraform


In this project i built a weight tracker web application using Terraform and Azure as my cloud provider,
Each module in the project has its own readme with descriptions of the variables and the main.tf files have comments for each resource explaining what they do.

**In order to be able to build the infrastructure a custom.tfvars file needs to be used for the apply command**

Instead of a .tfvars file i used azure vault to store and retrieve all my senestive content,
when using a .tfvars the variable `is-azure-vault-enabled` should be set to false, the code will recognize this and will not to try to promt vault for the sensitive data.

If you received a custom .tfvars file from me, the variable should already be set to false by default and ready to be used to build the infrastructure.


There are two template resources, one creates the API call script to update OKTA uri's, the other template creates the .env file creation script.
Both of these scripts are used later by ansible to cofigure the machines.

The project uses a linux virtual machine scale set for elasticity and a managed postgrSQL database flexible server.


*Note regarding SSH*: <br>
The created public security group for the web aplication VMSS grants the user access to the virtual machines by fethcing their current public IP and giving it SSH access in the first inbound rule in the network-security group, this behavior can be changed by adjusting the `source_address_prefix` parameter.


### Instructions
1. Start by installing all the needed packages for this project (az, terraform, git)
2. Login to your Azure account in the terminal - can be done with command `az login`
3. Clone the repository to an empty folder
4. Change directory to root-module in that folder
5. Run command "terraform init" to initialize the project and download all the necessary providers
6. At this point you can plan or build the project using the terraform build or apply commands with the flag -var-file="FILENAME.tfvars", it takes between 4-10 minutes for the infrastructure to be deployed.



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
| <a name="provider_local"></a> [local](#provider\_local) | 2.2.2 |
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
| [local_file.create-API-call-script](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [local_file.create-ENV-creation-script](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [template_file.api-call-shell-script](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |
| [template_file.env-creation-shell-script](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_COOKIE_ENCRYPT_PWD"></a> [COOKIE\_ENCRYPT\_PWD](#input\_COOKIE\_ENCRYPT\_PWD) | Variable of sensitive data that will be used with a custom .tfvars file instead of relying on vault | `string` | `null` | no |
| <a name="input_OKTA-client-ID"></a> [OKTA-client-ID](#input\_OKTA-client-ID) | The target OKTA client ID to update with an API call | `string` | `null` | no |
| <a name="input_OKTA-client-name"></a> [OKTA-client-name](#input\_OKTA-client-name) | The target OKTA client name to update with an API call | `string` | `null` | no |
| <a name="input_OKTA_CLIENT_SECRET"></a> [OKTA\_CLIENT\_SECRET](#input\_OKTA\_CLIENT\_SECRET) | Variable of sensitive data Fthat will be used with a custom .tfvars file instead of relying on vault | `string` | `null` | no |
| <a name="input_PGPASSWORD"></a> [PGPASSWORD](#input\_PGPASSWORD) | Variable of sensitive data that will be used with a custom .tfvars file instead of relying on vault | `string` | `null` | no |
| <a name="input_admin-password"></a> [admin-password](#input\_admin-password) | Variable of sensitive data that will be used with a custom .tfvars file instead of relying on vault | `string` | `null` | no |
| <a name="input_azure-vault-name"></a> [azure-vault-name](#input\_azure-vault-name) | The vault name to use for this project if enabled | `string` | `"staslevman-vault"` | no |
| <a name="input_azure-vault-rg-name"></a> [azure-vault-rg-name](#input\_azure-vault-rg-name) | The vault resource group name to use for this project if enabled | `string` | `"Vault-rg"` | no |
| <a name="input_inbound-nat-port-start"></a> [inbound-nat-port-start](#input\_inbound-nat-port-start) | The default port to start from for the application VMs SSH | `number` | `50101` | no |
| <a name="input_is-azure-vault-enabled"></a> [is-azure-vault-enabled](#input\_is-azure-vault-enabled) | Check to see if this project needs to use vault for all it's sensitive content | `bool` | `true` | no |
| <a name="input_okta-API-token"></a> [okta-API-token](#input\_okta-API-token) | Variable of sensitive data that will be used with a custom .tfvars file instead of relying on vault | `string` | `null` | no |
| <a name="input_postgresql-db-password"></a> [postgresql-db-password](#input\_postgresql-db-password) | Variable of sensitive data that will be used with a custom .tfvars file instead of relying on vault | `string` | `null` | no |
| <a name="input_resource-group-name"></a> [resource-group-name](#input\_resource-group-name) | The name of the resource group created | `string` | `null` | no |
| <a name="input_vmss-maximum-instances"></a> [vmss-maximum-instances](#input\_vmss-maximum-instances) | Maximum instance count for application VM scaling | `number` | `100` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_VM-password"></a> [VM-password](#output\_VM-password) | Password of the virtual machines. |
| <a name="output_public-ip"></a> [public-ip](#output\_public-ip) | n/a |
<!-- END_TF_DOCS -->