

output "public-scg-id" {
  value = azurerm_network_security_group.public-nsg.id
}


output "private-scg-id" {
  value = azurerm_network_security_group.private-nsg.id
}
