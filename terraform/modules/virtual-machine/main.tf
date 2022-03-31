



resource "azurerm_public_ip" "VM-public-ip-address" {
  allocation_method   = "Static"
  location            = var.location
  name                = "public-VM-ip-00${count.index + 1}"
  resource_group_name = var.rg-name
}




#------------------------------
# Creating VM network interface
#------------------------------
resource "azurerm_network_interface" "VM-NIC" {
  location            = var.location
  name                = "VM-NIC-name-00${count.index + 1}"
  resource_group_name = var.rg-name
  ip_configuration {
    public_ip_address_id = azurerm_public_ip.VM-public-ip-address.id
    name                          = "VM-NIC-ip-config-00${count.index + 1}"
    subnet_id                     = var.public-subnet-id
    private_ip_address_allocation = "Dynamic"
  }
}




#-------------------------------
# Creating linux virtual machine
#-------------------------------
resource "azurerm_linux_virtual_machine" "linux-VM" {
  admin_username                  = var.VM-username
  location                        = var.location
  name                            = "${var.VM-name}-00${count.index + 1}"
  network_interface_ids           = [var.application-NIC-id]
  resource_group_name             = var.rg-name
  size                            = "Standard_B1s"
  admin_password                  = var.admin-password
  disable_password_authentication = "false"
  custom_data                     = var.VM-custom-data
  source_image_reference {
    offer     = "0001-com-ubuntu-server-focal"
    publisher = "Canonical"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }

  os_disk {
    name                 = "web-application-VM-disk-00${count.index + 1}"
    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"
  }
}

