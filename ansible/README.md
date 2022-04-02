# Weight tracker Ansible

### Inventory creation
Since we are creating an ever-changing scale set with azure, and there is no direct SSH access to the machines IP, i decided to go 
with a dynamic inventory strategy and password validation (No SSH keys). <br><br>
The role <a href="https://github.com/sincros121/Weight-tracker-with-Terraform-and-Ansible/tree/main/ansible/roles/get-vmss-inventory" title="">get-vmss-inventory</a>
builds our dynamic inventory using the azure.azcollection collection, it can be installed using ansible-galaxy, each time the role is called it fetches the current IPs and inbound NAT ports to build the hosts to configure.
<br><br>
Please note the role has a main.yml file in the defaults folder, by default that file is encrypted as it contains the password to the virtual machine SSH connection.
an ansible-vault password will need to be used to retrieve the password upon calling this role.
<br><br>

### Application configuration
For configuring the scale set machines we have the 
<a href="https://github.com/sincros121/Weight-tracker-with-Terraform-and-Ansible/tree/main/ansible/roles/web-application-setup" title="">web-application-setup</a>
role.
It installs the necessary packages and configures the VMs.
Please note that part of the configuration is also using two shell scripts that Terraform generates in the "files" folder of the role after deploying the infrastructure.
<br>
<br>
Both roles are part of the playbooks in the main ansible folder: stage.yml and prod.yml, each of files when executed with ansible configures their own respective environment.
