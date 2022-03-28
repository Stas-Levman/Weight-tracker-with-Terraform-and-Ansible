
#------------------------------------------------------------------------------------------------------
# Fetching the users public IP address to automatically add it to web applications VMs SSH access rule,
# If not possible to fetch or different behaviour is required please change the "source_address_prefix"
# in the first security rule below.
#------------------------------------------------------------------------------------------------------
data "http" "user-IP" {
  url = "https://ifconfig.me"
}

#------------------------------------------------------------------------------------
# Creating security group for the public subnet, it will allow port 22 from users IP,
# tcp port 8080 from all sources, and deny all else
#------------------------------------------------------------------------------------
resource "azurerm_network_security_group" "public-nsg" {
  name                = var.public-nsg-name
  location            = var.location
  resource_group_name = var.rg-name

  security_rule {
    name                       = "AllowSSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = data.http.user-IP.body
    destination_address_prefix = "10.0.1.0/24"
  }

  security_rule {
    name                       = "AllowPort_8080"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8080"
    source_address_prefix      = "*"
    destination_address_prefix = "10.0.1.0/24"
  }

  security_rule {
    name                       = "DenyAll"
    priority                   = 400
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowPortOut5432"
    priority                   = 310
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5432"
    source_address_prefix      = "10.0.0.0/24"
    destination_address_prefix = "10.0.1.0/24"
  }
}


#-----------------------------------------------------------------------------------------------------
# Creating security group for the private subnet, it will allow port 5432 only from the public subnet,
# allow SSH only from the public subnet, and deny all else
#-----------------------------------------------------------------------------------------------------
resource "azurerm_network_security_group" "private-nsg" {
  name                = var.private-nsg-name
  location            = var.location
  resource_group_name = var.rg-name

  security_rule {
    name                       = "AllowSSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "10.0.1.0/24"
    destination_address_prefix = "10.0.2.0/24"
  }

  security_rule {
    name                       = "AllowPSQL"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5432"
    source_address_prefix      = "10.0.1.0/24"
    destination_address_prefix = "10.0.2.0/24"
  }

  security_rule {
    name                       = "DenyAll"
    priority                   = 400
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}