
output "vmss-minimum-amount" {
  value = azurerm_linux_virtual_machine_scale_set.web-application-VM-scale-set.instances
}

output "VM-password" {
  value = azurerm_linux_virtual_machine_scale_set.web-application-VM-scale-set.admin_password
  sensitive = true
}
#
#output "vmss_ip_forwarding" {
#  value = azurerm_linux_virtual_machine_scale_set.web-application-VM-scale-set.network_interface.enable_ip_forwarding
#}
#
#output "vmss_" {
#  value = azurerm_linux_virtual_machine_scale_set.web-application-VM-scale-set.
#}

output "vmss-name" {
  value = azurerm_linux_virtual_machine_scale_set.web-application-VM-scale-set.name
}