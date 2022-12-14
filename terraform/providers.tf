terraform {
  required_version = ">= 1.1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  backend "azurerm" {
    resource_group_name = "feraudt-student-works"
    storage_account_name = "feraudtazrepo"
    container_name = "terraform-state"
    key = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}
