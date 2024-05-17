terraform {
  backend "azurerm" {
    key = "Jenkins"
    resource_group_name = "value"
    storage_account_name = "value"
    container_name = "value"
    access_key = "value"
  }
}