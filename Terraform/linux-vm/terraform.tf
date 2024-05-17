resource "azurerm_linux_virtual_machine" "linux_vm" {
  name = var.vm_name
  resource_group_name = var.resource_group
  location = var.location
  admin_username = var.admin_username
  admin_password = var.admin_password
  disable_password_authentication = false
  network_interface_ids = var.network_interface_ids
  size = var.size
  os_disk {
    caching = "ReadWrite"
    storage_account_type = var.storage_account_type
  }

    source_image_reference {
      publisher = var.publisher
      version = var.image_version
      sku = var.sku
      offer = var.offer
    }
}