output "public-ip" {
  value = azurerm_public_ip.load-balancer-public-ip.ip_address
}

# Password of the virtual machines.
output "VM-password" {
  value     = module.web-application-vmss.VM-password
  sensitive = true
}

#output "inbound-NAT-rules" {
#  value = module.front-load-balancer.inbound-NAT-rules[0]
#}
##
##output "vmss-data" {
##  value = data.azurerm_virtual_machine_scale_set.vmss-data.network_interface
##}
#
##output "lb-data-ips" {
##  value = data.azurerm_lb.lb-data.private_ip_addresses
##}
##
##
##output "lb-data-" {
##  value = data.azurerm_lb.lb-data.frontend_ip_configuration
##}

output "LB-frontend-IP-confguration-Inbound-nat-rules" {
  value = module.front-load-balancer.frontend-ip-confguration-inbound-nat-rules
}