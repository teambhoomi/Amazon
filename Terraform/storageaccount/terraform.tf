resource "azurerm_storage_account" "storage" {
  name = "${var.base}${random_integer.int.result}"
  location = var.location
  resource_group_name = var.resource_group
  account_replication_type = var.account_replication_type
  account_tier = var.account_tier
  access_tier = var.access_tier

  min_tls_version = "TLS1_1"
  
}

resource "random_integer" "int" {
  min = 1
  max = 99999
}