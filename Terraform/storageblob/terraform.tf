resource "azurerm_storage_blob" "blob" {
  name = "${var.base}${random_integer.integer.result}"
  storage_account_name = var.storage_account
  storage_container_name = var.container_name
  type = "Block"
}

resource "random_integer" "integer" {
  min = 1
  max = 9999
}