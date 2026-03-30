terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  skip_provider_registration = "true"
  features {} 
}

resource "azurerm_resource_group" "training" {
  name     = var.training_rg_name
  location = "westeurope"
}

variable "training_rg_name" {
  type = string

}