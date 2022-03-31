output "public-ip" {
  value = azurerm_public_ip.load-balancer-public-ip.ip_address
}

# Password of the virtual machines.
output "VM-password" {
  value     = module.web-application-vmss.VM-password
  sensitive = true
}