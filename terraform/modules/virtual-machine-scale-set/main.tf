

#-------------------------------------------------------------------------------------------------------------------
# Creating the linux virtual machine scale set amd it's network interface that will be used for the web application,
# assigning it the public subnet and adding it the LB backend pool
#-------------------------------------------------------------------------------------------------------------------
resource "azurerm_linux_virtual_machine_scale_set" "web-application-VM-scale-set" {
  name                            = "web-application-VM-scale-set"
  resource_group_name             = var.rg-name
  location                        = var.location
  sku                             = terraform.workspace == "stage" ? "Standard_B1s" : "Standard_B2s"
  instances                       = 3
  admin_username                  = "ubuntu"
  admin_password                  = var.admin-password
  disable_password_authentication = false
#  custom_data                     = var.VM-custom-data


  source_image_reference {
    offer     = "0001-com-ubuntu-server-focal"
    publisher = "Canonical"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "StandardSSD_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name                 = "vmss-nic"
    primary              = true
    enable_ip_forwarding = true


    ip_configuration {
      name                                   = "scale-set-ip-config"
      primary                                = true
      subnet_id                              = var.public-subnet-id
      load_balancer_backend_address_pool_ids = var.backend-address-pool-ids
      load_balancer_inbound_nat_rules_ids    = var.nat-rule-ids
    }
  }
}


#-----------------------------------------------------------------------------------------------------------------------
# Creating the scaling configuration used for the VMSS, starting and minimum amount of virtual machines is set to 3
# The maximum amount is passed as a variable, machines horizontally scale in and out based on CPU usage.
#-----------------------------------------------------------------------------------------------------------------------
resource "azurerm_monitor_autoscale_setting" "vmss-auto-scaling-setting" {
  name                = "vmss-auto-scaling-setting"
  resource_group_name = var.rg-name
  location            = var.location
  target_resource_id  = azurerm_linux_virtual_machine_scale_set.web-application-VM-scale-set.id

  profile {
    name = "default-profile"

    capacity {
      default = 3
      minimum = 3
      maximum = var.vmss-maximum-instances
    }

    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_linux_virtual_machine_scale_set.web-application-VM-scale-set.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "GreaterThan"
        threshold          = 75
        metric_namespace   = "microsoft.compute/virtualmachinescalesets"
      }

      scale_action {
        direction = "Increase"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT1M"
      }
    }

    rule {
      metric_trigger {
        metric_name        = "Percentage CPU"
        metric_resource_id = azurerm_linux_virtual_machine_scale_set.web-application-VM-scale-set.id
        time_grain         = "PT1M"
        statistic          = "Average"
        time_window        = "PT5M"
        time_aggregation   = "Average"
        operator           = "LessThan"
        threshold          = 25
      }

      scale_action {
        direction = "Decrease"
        type      = "ChangeCount"
        value     = "1"
        cooldown  = "PT1M"
      }
    }
  }
}

