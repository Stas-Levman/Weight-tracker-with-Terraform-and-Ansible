output "backend-pool" {
  value = azurerm_lb_backend_address_pool.web-application-backend-pool
}

output "inbound-nat-rule-id" {
  value = azurerm_lb_nat_pool.lb-nat-pool.id
}

