
locals {
  #Default resource location that will be used for the resource group and all the resources in it.
  def-location = azurerm_resource_group.resource-group.location

  #Default resource group that will be used for all created resources in the project.
  rg-name = azurerm_resource_group.resource-group.name

  #The public IP used for the load balancer.
  lb-public-ip-address = azurerm_public_ip.load-balancer-public-ip.ip_address

}



#-------------------------------------------------------------------------------------------------------
# Creates and uses vault resources for sensitive data IF variable is-azure-vault-enabled is set to true,
# If not enable, a custom .tfvars file will be needed to replace all the sensitive data.
#-------------------------------------------------------------------------------------------------------
module "azure-vault" {
  source = "../modules/azure-vault"
  count = var.is-azure-vault-enabled ? 1 : 0


  azure-vault-name           = var.azure-vault-name
  azure-vault-resource-group = var.azure-vault-rg-name
}

#-----------------------------------------------------------------------------------------------------
# Creates the resource group that will be used throughout the project
#-----------------------------------------------------------------------------------------------------
resource "azurerm_resource_group" "resource-group" {
  name     = "weight-tracker-rg"
  location = "East US"
}


#-----------------------------------------------------------------------------------------------------
# Creates the two security groups used in this project
#-----------------------------------------------------------------------------------------------------
module "network-security-groups" {
  source = "../modules/network-security-groups"

  public-nsg-name  = "public-nsg"
  private-nsg-name = "private-nsg"
  location         = local.def-location
  rg-name          = local.rg-name
}


#-----------------------------------------------------------------------------------------------------
# Creates the virtual network groups used in this project
#-----------------------------------------------------------------------------------------------------
resource "azurerm_virtual_network" "vnet" {
  name                = "weight-tracker-vnet"
  location            = local.def-location
  resource_group_name = local.rg-name
  address_space       = ["10.0.0.0/22"]
}


#--------------------------------------------------------------------------------------------------------
# Creates the two security groups used in this project and associates the network security groups to them
#--------------------------------------------------------------------------------------------------------
module "subnets" {
  source = "../modules/subnets"

  rg-name        = local.rg-name
  vnet-name      = azurerm_virtual_network.vnet.name
  public-scg-id  = module.network-security-groups.public-scg-id
  private-scg-id = module.network-security-groups.private-scg-id

  depends_on = [azurerm_virtual_network.vnet, module.network-security-groups]
}

#--------------------------------------------------------------------------------------------------------
# Creates the public ip that will be used for the load balancer
# This IP will be added to the public security group for SSH access
# Okta will be automatically updated with the new URIs with this IP address
#--------------------------------------------------------------------------------------------------------
resource "azurerm_public_ip" "load-balancer-public-ip" {
  name                = "front-public-ip"
  resource_group_name = local.rg-name
  location            = local.def-location
  allocation_method   = "Static"
  sku                 = "Standard"
}


#---------------------------------------------------------------------------------------------------------
# This resource inputs the sensitive data we fetched either from azure vault or from the .tfvars file into
# the custom data shell script that will be used to configure the virtual machines in the scale set,
# create the .env file, and update the URIs in okta via API.
#---------------------------------------------------------------------------------------------------------
data "template_file" "custom-data-shell-script" {
  template = file("${path.module}/VM-startup-script-template.sh")

  vars = {
    okta-API-token     = var.is-azure-vault-enabled ? module.azure-vault[0].okta-API-token : var.okta-API-token
    PGHOST             = module.weight-tracker-postgresql-db.psql-fqdn
    PGPASSWORD         = var.is-azure-vault-enabled ? module.azure-vault[0].weight-tracker-PSQL-password : var.PGPASSWORD
    HOST_URL_IP        = local.lb-public-ip-address
    COOKIE_ENCRYPT_PWD = var.is-azure-vault-enabled ? module.azure-vault[0].cookie-encrypt-pwd : var.COOKIE_ENCRYPT_PWD
    OKTA_CLIENT_SECRET = var.is-azure-vault-enabled ? module.azure-vault[0].okta-client-secret : var.OKTA_CLIENT_SECRET
  }

}

#--------------------------------------------------------------------------------------------------------------
# Creates the public load balancer that will be used to access the application on the virtual machine scale set,
# SSH access to the virtual machines is given via inbound NAT configuration
#--------------------------------------------------------------------------------------------------------------
module "front-load-balancer" {
  source = "../modules/load-balancer"

  rg-name                  = local.rg-name
  def-location             = local.def-location
  public-ip-id             = azurerm_public_ip.load-balancer-public-ip.id
  public-subnet-id         = module.subnets.public-subnet-id
  frontend-port-start      = var.inbound-nat-port-start
  frontend-port-end        = var.inbound-nat-port-start + var.vmss-maximum-instances
  backend-address-pool-ids = [module.front-load-balancer.backend-pool.id]
}

#--------------------------------------------------------------------------------------------------------------
# Creates the virtual machine scale set for the web application, a shell script is inserted into the machines
# via custom data, it will configure the machine with all the necessary configurations at provisioning
# For admin password checks if using vault or .tfvars
#--------------------------------------------------------------------------------------------------------------
module "web-application-vmss" {
  source = "../modules/virtual-machine-scale-set"

  location                 = local.def-location
  rg-name                  = local.rg-name
  VM-username              = "ubuntu"
  admin-password           = var.is-azure-vault-enabled ? module.azure-vault[0].vm-password : var.admin-password
  backend-address-pool-ids = [module.front-load-balancer.backend-pool.id]
  nat-rule-ids             = [module.front-load-balancer.inbound-nat-rule-id]
  public-subnet-id         = module.subnets.public-subnet-id
  VM-custom-data           = base64encode(data.template_file.custom-data-shell-script.rendered)
  vmss-maximum-instances   = var.vmss-maximum-instances

  depends_on = [module.front-load-balancer, module.weight-tracker-postgresql-db]
}

#--------------------------------------------------------------------------------------------------------------
# Creates the private flexible PostgreSQL server that the application will use as database
#--------------------------------------------------------------------------------------------------------------
module "weight-tracker-postgresql-db" {
  source = "../modules/managed-postrgeSQL-database"

  location               = local.def-location
  rg-name                = local.rg-name
  postgresql-db-password = var.is-azure-vault-enabled ? module.azure-vault[0].weight-tracker-PSQL-password : var.postgresql-db-password
  private-subnet-id      = module.subnets.private-subnet-id
  vnet-id                = azurerm_virtual_network.vnet.id

  depends_on = [module.subnets]

}


















