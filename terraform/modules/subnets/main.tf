

#-----------------------------------------------------------------------------------------------------------------------
# Creating the public and private subnets we are going to use for this project and delegating the private subnet
# to the managed postgreSQL server we will be using on this project
#-----------------------------------------------------------------------------------------------------------------------
resource "azurerm_subnet" "public" {
  name                 = "public"
  resource_group_name  = var.rg-name
  virtual_network_name = var.vnet-name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_subnet" "private" {
  name                 = "private"
  resource_group_name  = var.rg-name
  virtual_network_name = var.vnet-name
  address_prefixes     = ["10.0.2.0/24"]
  service_endpoints = ["Microsoft.Storage", ]

  delegation {
    name = "database-subnet-delegation"
    service_delegation {
      name = "Microsoft.DBforPostgreSQL/flexibleServers"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }
}


#-----------------------------------------------------------
# Associating the public security group to the public subnet
#-----------------------------------------------------------
resource "azurerm_subnet_network_security_group_association" "associate-public-SCG" {
  subnet_id                 = azurerm_subnet.public.id
  network_security_group_id = var.public-scg-id
}


#------------------------------------------------------------
# Associating the private security group to the public subnet
#------------------------------------------------------------
resource "azurerm_subnet_network_security_group_association" "associate-private-SCG" {
  subnet_id                 = azurerm_subnet.private.id
  network_security_group_id = var.private-scg-id

}