resource "azurerm_network_interface" "nic" {
  name = var.nic_name
  resource_group_name = var.resource_group
  location = var.location
  
  
  ip_configuration {
  
    name = "rule-1"
    private_ip_address_allocation = "Dynamic"
    subnet_id = var.subnet_id
    public_ip_address_id = var.public_ip_address_id

  
  }

}