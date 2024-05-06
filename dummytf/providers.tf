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
    key = "terraform.tfstate"
    use_oidc = true
    use_azuread_auth = true
  }
}

provider "azurerm" {
  features {}
}

provider "null" {}