resource "azurerm_virtual_network" "vnet" {
  name = "${var.base}${random_integer.int.result}"
  resource_group_name = var.resource_group
  location = var.location
  address_space = var.address_space
}

resource "random_integer" "int" {
  min = 1
  max = 20
}