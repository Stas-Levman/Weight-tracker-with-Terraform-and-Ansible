output "backend-pool" {
  value = azurerm_lb_backend_address_pool.web-application-backend-pool
}

output "inbound-nat-rule-id" {
  value = azurerm_lb_nat_pool.lb-nat-pool.id
}

output "inbound-NAT-rules" {
  value = azurerm_lb.front-load-balancer.frontend_ip_configuration[*]
}

output "lb-pool-name" {
  value = azurerm_lb_backend_address_pool.web-application-backend-pool.name
}

output "lb-id" {
  value = azurerm_lb.front-load-balancer.id
}


output "lb-name" {
  value = azurerm_lb.front-load-balancer.name
}


