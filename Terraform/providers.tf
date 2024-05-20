terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.104.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.1"
    }
  }
}


provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  //client_id       = var.tf_var_client_id
  //subscription_id = var.tf_var_subscription_id
  //client_secret   = var.tf_var_client_secret
  //tenant_id       = var.tf_var_tenant_id
}
