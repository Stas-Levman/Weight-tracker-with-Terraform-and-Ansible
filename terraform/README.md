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



### Resources used in the template
- `azure-vault`
- `azurerm_resource_group`
- `azurerm_virtual_network`
- `azurerm_public_ip`
- `azurerm_network_security_group`
- `azurerm_subnet`
- `azurerm_subnet_network_security_group_association`
- `azurerm_lb`
- `azurerm_lb_backend_address_pool`
- `azurerm_lb_outbound_rule`
- `azurerm_lb_probe`
- `azurerm_lb_rule`
- `azurerm_lb_nat_pool`
- `azurerm_private_dns_zone`
- `azurerm_private_dns_zone_virtual_network_link`
- `azurerm_postgresql_flexible_server`
- `azurerm_postgresql_flexible_server_configuration`
- `azurerm_linux_virtual_machine_scale_set`
- `azurerm_monitor_autoscale_setting` 
 

- `azurerm_network_interface` - not used in the project
- `azurerm_linux_virtual_machine` - not used in the project 

 


### Special provider resources used in the template
- `http`
- `template_file`


