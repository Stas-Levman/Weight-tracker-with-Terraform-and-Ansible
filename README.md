# Weight tracker with Terraform and Ansible

In this project i built two environment of the weight tracker web application using Terraform, Azure as my cloud provider, ansible for configuration management and OKTA for authentication.
The project uses two "Applications" on okta's side for authentication, one for each of the environment.
For details regarding Terraform please read the readme file in the <a href="https://github.com/sincros121/Weight-tracker-with-Terraform-and-Ansible/tree/main/terraform" title="">Terraform folder</a>.
For details regarding Ansible please read the readme file in the <a href="https://github.com/sincros121/Weight-tracker-with-Terraform-and-Ansible/tree/main/ansible" title="">Ansible folder</a>.

The terraform part of the project requires a custom .tfvars file with appropriate variables.

### instructions
#### Terraform
1. Start by installing all the needed packages for this project (az, terraform, git, ansible and all the ansible related packages)
2. Login to your Azure account in the terminal - can be done with command `az login`
3. Clone the repository to an empty folder
4. Change directory to root-module in that folder
5. Run command "terraform init" to initialize the project and download all the necessary providers
6. Create two workspaces named "stage" and "prod" using "terraform workspace new "NAME" comamnd.
7. switch to either the stage or prod workspace and run the command `terraform plan -var-file "$(terraform workspace show).tfvars"` to create the selected environment infrastructure.

#### Ansible
8. Change directory to the "Ansible" folder
9. Run the command `export ANSIBLE_HOST_KEY_CHECKING=False` in order to set SSH key checking off so we'll be able to use passwords instead (Or change global setting in the ansible config file).
10. Install SSHpass with command `sudo apt install sshpass -y`.
11. Run the command `ansible-playbook stage.yml --ask-vault-password` to configure the stage infrastructure.
12. Run the command `ansible-playbook prod.yml --ask-vault-password` to configure the prod infrastructure.
