terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {} 
}

data "azurerm_resource_group" "training-rg" {
    name = "rg-terraform-training-vars"
}

module "webapp" {
    source = "./modules/"
    location = data.azurerm_resource_group.training-rg.location
    rg_name = data.azurerm_resource_group.training-rg.name
}

output "url" {
    value = module.webapp.webapp_url
}