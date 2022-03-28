output "public-ip" {
  value = azurerm_public_ip.load-balancer-public-ip.ip_address
}

# Password of the virtual machines.
output "VM-password" {
  value     = var.is-azure-vault-enabled ? module.azure-vault[0].vm-password : var.admin-password
  sensitive = true
}
