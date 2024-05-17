resource "azurerm_network_security_group" "nsg" {
  name = "${var.base}${random_integer.int.result}"
  resource_group_name = var.resource_group
  location = var.location

}

resource "random_integer" "int" {
  min = 1
  max = 30
}