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
| [azurerm_linux_virtual_machine.linux-VM](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.VM-NIC](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_VM-amount"></a> [VM-amount](#input\_VM-amount) | Amount of instances created, also used to define instance and related resources names. | `string` | n/a | yes |
| <a name="input_VM-custom-data"></a> [VM-custom-data](#input\_VM-custom-data) | Custom data to run on the VM at the provisioning state | `string` | n/a | yes |
| <a name="input_VM-name"></a> [VM-name](#input\_VM-name) | n/a | `string` | n/a | yes |
| <a name="input_VM-username"></a> [VM-username](#input\_VM-username) | Admin username for the virtual machine. | `string` | n/a | yes |
| <a name="input_admin-password"></a> [admin-password](#input\_admin-password) | n/a | `string` | n/a | yes |
| <a name="input_application-NIC-id"></a> [application-NIC-id](#input\_application-NIC-id) | The ID of the network interface we will be using for the application VM | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location of the resource. | `string` | n/a | yes |
| <a name="input_public-subnet-id"></a> [public-subnet-id](#input\_public-subnet-id) | Id of the public subnet | `string` | n/a | yes |
| <a name="input_rg-name"></a> [rg-name](#input\_rg-name) | The name of the resource group the resource will be deployed to. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->