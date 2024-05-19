resource "azurerm_subnet" "subnet-jenkins" {
  name = var.subnet_name
  resource_group_name = var.resource_group
  virtual_network_name = var.vnet_name
  address_prefixes = var.address_prefixes
}