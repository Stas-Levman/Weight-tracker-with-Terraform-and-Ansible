
output "public-subnet-id" {
  value = azurerm_subnet.public.id
}

output "private-subnet-id" {
  value = azurerm_subnet.private.id
}
