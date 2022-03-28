

locals {
  key-vault-id = data.azurerm_key_vault.azure-vault.id

  azure-vault-secrets = tomap({
    VM-password                 = "VM-password"
    cookie-encrypt-pwd          = "cookie-encrypt-pwd"
    okta-client-secret          = "okta-client-secret"
    weight-tacker-PSQL-password = "weight-tacker-PSQL-password"
    OKTA-api-token              = "OKTA-api-token"
    }
  )
}


#-----------------------------------------------------------------------------------------------------------
# Fetching all necessary passwords and secrets for this application and it's infrastructure from azure vault.
#-----------------------------------------------------------------------------------------------------------
data "azurerm_key_vault" "azure-vault" {
  name                = var.azure-vault-name
  resource_group_name = var.azure-vault-resource-group
}

data "azurerm_key_vault_secret" "vm-password" {
  key_vault_id = local.key-vault-id
  name         = local.azure-vault-secrets["VM-password"]
}

data "azurerm_key_vault_secret" "cookie-encrypt-pwd" {
  key_vault_id = local.key-vault-id
  name         = local.azure-vault-secrets["cookie-encrypt-pwd"]
}

data "azurerm_key_vault_secret" "okta-client-secret" {
  key_vault_id = local.key-vault-id
  name         = local.azure-vault-secrets["okta-client-secret"]
}

data "azurerm_key_vault_secret" "weight-tacker-PSQL-password" {
  key_vault_id = local.key-vault-id
  name         = local.azure-vault-secrets["weight-tacker-PSQL-password"]
}

data "azurerm_key_vault_secret" "okta-API-token" {
  key_vault_id = local.key-vault-id
  name         = local.azure-vault-secrets["OKTA-api-token"]
}
