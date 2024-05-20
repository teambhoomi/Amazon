resource "azurerm_network_interface_security_group_association" "nsg-to-nic" {
  network_interface_id = var.nic_id
  network_security_group_id = var.nsg_id
}