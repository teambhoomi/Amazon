resource "azurerm_resource_group" "rsg" {
  name = "${var.base}"
  location = var.location
}