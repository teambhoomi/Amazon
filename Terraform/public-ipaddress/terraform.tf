resource "azurerm_public_ip" "public-ip" {
  name = var.public_ip_name
  resource_group_name = var.resource_group
  location = var.location
  allocation_method = var.allocation_method
}