
output "vmss-minimum-amount" {
  value = azurerm_linux_virtual_machine_scale_set.web-application-VM-scale-set.instances
}

