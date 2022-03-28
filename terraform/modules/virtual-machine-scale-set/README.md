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
| [azurerm_linux_virtual_machine_scale_set.web-application-VM-scale-set](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine_scale_set) | resource |
| [azurerm_monitor_autoscale_setting.vmss-auto-scaling-setting](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_autoscale_setting) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_VM-custom-data"></a> [VM-custom-data](#input\_VM-custom-data) | The custom data we are inserting in to the machine and running at provision stage, This data is responsible for configuring the virtual machine | `string` | n/a | yes |
| <a name="input_VM-username"></a> [VM-username](#input\_VM-username) | Admin username for the virtual machine. | `string` | n/a | yes |
| <a name="input_admin-password"></a> [admin-password](#input\_admin-password) | The password used for the virtual machines | `string` | n/a | yes |
| <a name="input_backend-address-pool-ids"></a> [backend-address-pool-ids](#input\_backend-address-pool-ids) | A list of backend pool IDs, the VMSS is going in this list | `list(string)` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location of the resource. | `string` | n/a | yes |
| <a name="input_nat-rule-ids"></a> [nat-rule-ids](#input\_nat-rule-ids) | A list of nar rule IDs | `list(string)` | n/a | yes |
| <a name="input_public-subnet-id"></a> [public-subnet-id](#input\_public-subnet-id) | Id of the public subnet | `string` | n/a | yes |
| <a name="input_rg-name"></a> [rg-name](#input\_rg-name) | The name of the resource group the resource will be deployed to. | `string` | n/a | yes |
| <a name="input_vmss-maximum-instances"></a> [vmss-maximum-instances](#input\_vmss-maximum-instances) | The maximum amount of virtual machines to scale yo to | `number` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vmss-minimum-amount"></a> [vmss-minimum-amount](#output\_vmss-minimum-amount) | n/a |
<!-- END_TF_DOCS -->