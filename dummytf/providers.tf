terraform {
  required_providers {

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.101.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2.2"
    }

  }

  backend "azurerm" {
    resource_group_name  = "rg-mrjn-sandbox"
    storage_account_name = "mrjndevopstfstate"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    use_oidc             = true
    use_azuread_auth     = true
    subscription_id      = var.azure_subscription_id
    tenant_id            = var.azure_tenant_id
    client_id            = var.azure_client_id
  }
}

provider "azurerm" {
  features {}
}

provider "null" {}