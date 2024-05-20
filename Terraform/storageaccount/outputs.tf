output "storage_name_out" {
  value = azurerm_storage_account.storage.name
}

output "account_replication_type_out" {
  value = azurerm_storage_account.storage.account_replication_type
}

output "account_tier_out" {
  value = azurerm_storage_account.storage.account_tier
}

output "access_key_out" {
  value = azurerm_storage_account.storage.primary_access_key
}