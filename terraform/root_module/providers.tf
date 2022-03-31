# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.65"
    }
  }

#  backend "azurerm" {
#    resource_group_name = "Vault-rg"
#    storage_account_name = "staslevman00tfstate"
#    container_name = "tfstate"
#    key = "terraform.tfstate"
#  }

  required_version = ">= 1.1.7"
}

provider "azurerm" {
  features {}
}

provider "local" {}

provider "template" {}

provider "http" {}