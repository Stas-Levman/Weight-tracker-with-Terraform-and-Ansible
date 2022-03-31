

output "vm-password" {
  value     = data.azurerm_key_vault_secret.vm-password.value
  sensitive = true
}

output "okta-API-token" {
  value     = data.azurerm_key_vault_secret.okta-API-token.value
  sensitive = true
}

output "okta-client-secret" {
  value     = data.azurerm_key_vault_secret.okta-client-secret.value
  sensitive = true
}

output "cookie-encrypt-pwd" {
  value     = data.azurerm_key_vault_secret.cookie-encrypt-pwd.value
  sensitive = true
}

output "weight-tracker-PSQL-password" {
  value     = data.azurerm_key_vault_secret.weight-tracker-PSQL-password.value
  sensitive = true
}

