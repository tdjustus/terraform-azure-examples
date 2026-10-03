terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.22"
    }
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}