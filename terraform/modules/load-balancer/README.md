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
| [azurerm_lb.front-load-balancer](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb) | resource |
| [azurerm_lb_backend_address_pool.web-application-backend-pool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_backend_address_pool) | resource |
| [azurerm_lb_nat_pool.lb-nat-pool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_nat_pool) | resource |
| [azurerm_lb_outbound_rule.front-lb-outbound-rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_outbound_rule) | resource |
| [azurerm_lb_probe.port-8080-hp](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_probe) | resource |
| [azurerm_lb_rule.lb-rule](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backend-address-pool-ids"></a> [backend-address-pool-ids](#input\_backend-address-pool-ids) | A list of IDs of backend pools for the LB to use | `list(string)` | n/a | yes |
| <a name="input_def-location"></a> [def-location](#input\_def-location) | Location for the LB deployment | `string` | n/a | yes |
| <a name="input_frontend-port-end"></a> [frontend-port-end](#input\_frontend-port-end) | The ending point of the port range for the NAT configuration | `string` | n/a | yes |
| <a name="input_frontend-port-start"></a> [frontend-port-start](#input\_frontend-port-start) | The starting point of the port range for the NAT configuration | `string` | n/a | yes |
| <a name="input_public-ip-id"></a> [public-ip-id](#input\_public-ip-id) | Id of the public IP | `string` | n/a | yes |
| <a name="input_public-subnet-id"></a> [public-subnet-id](#input\_public-subnet-id) | Id of the public subnet | `string` | n/a | yes |
| <a name="input_rg-name"></a> [rg-name](#input\_rg-name) | Resource group name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_backend-pool"></a> [backend-pool](#output\_backend-pool) | n/a |
| <a name="output_inbound-nat-rule-id"></a> [inbound-nat-rule-id](#output\_inbound-nat-rule-id) | n/a |
<!-- END_TF_DOCS -->