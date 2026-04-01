terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  resource_provider_registrations = "none"
  features {} 
}

resource "azurerm_resource_group" "training" {
  name     = var.training_rg_name
  location = "westeurope"
}
