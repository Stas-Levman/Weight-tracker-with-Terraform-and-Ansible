

variable "vmss-maximum-instances" {
  type        = number
  default     = 100
  description = "Maximum instance count for application VM scaling"
}

variable "inbound-nat-port-start" {
  type        = number
  default     = 50101
  description = "The default port to start from for the application VMs SSH"
}

variable "is-azure-vault-enabled" {
  type        = bool
  default     = true
  description = "Check to see if this project needs to use vault for all it's sensitive content"
}

variable "azure-vault-name" {
  type        = string
  default     = "staslevman-vault"
  description = "The vault name to use for this project if enabled"
}

variable "azure-vault-rg-name" {
  type        = string
  default     = "Vault-rg"
  description = "The vault resource group name to use for this project if enabled"
}

variable "resource-group-name" {
  type = string
  default = null
  description = "The name of the resource group created"
}

variable "okta-API-token" {
  default     = null
  type        = string
  description = "Variable of sensitive data that will be used with a custom .tfvars file instead of relying on vault"
}

variable "PGPASSWORD" {
  default     = null
  type        = string
  description = "Variable of sensitive data that will be used with a custom .tfvars file instead of relying on vault"
}

variable "COOKIE_ENCRYPT_PWD" {
  default     = null
  type        = string
  description = "Variable of sensitive data that will be used with a custom .tfvars file instead of relying on vault"
}

variable "OKTA-client-ID" {
  default     = null
  type        = string
  description = "The target OKTA client ID to update with an API call"
}

variable "OKTA-client-name" {
  default     = null
  type        = string
  description = "The target OKTA client name to update with an API call"
}

variable "OKTA_CLIENT_SECRET" {
  default     = null
  type        = string
  description = "Variable of sensitive data Fthat will be used with a custom .tfvars file instead of relying on vault"
}

variable "admin-password" {
  default     = null
  type        = string
  description = "Variable of sensitive data that will be used with a custom .tfvars file instead of relying on vault"
}

variable "postgresql-db-password" {
  default     = null
  type        = string
  description = "Variable of sensitive data that will be used with a custom .tfvars file instead of relying on vault"
}
