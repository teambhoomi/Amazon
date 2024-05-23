module "resource_group" {
  source   = "./resourcegroup"
  base     = "terra"
  location = "Central India"
}

module "storage_account" {
  source                   = "./storageaccount"
  base                     = "terrastoragee"
  resource_group           = module.resource_group.rg_out
  location                 = module.resource_group.location_out
  account_replication_type = "LRS"
  account_tier             = "Standard"
  access_tier              = "Hot"
  
}

module "storage_container" {
  source         = "./storagecontainer"
  container_name = "container-terra"
  storage_name   = module.storage_account.storage_name_out


}

module "storage_blob" {
  source          = "./storageblob"
  storage_account = module.storage_account.storage_name_out
  container_name  = module.storage_container.container_name_out
  base            = "blob-terra"
}

module "virtual_networks" {
  source         = "./virtualnetworks"
  location       = module.resource_group.location_out
  resource_group = module.resource_group.rg_out
  address_space  = ["172.16.0.0/16"]
  base           = "terra-vnet"

}

module "network_security_group" {
  source         = "./networksecuritygroup"
  base           = "terra-nsg"
  resource_group = module.resource_group.rg_out
  location       = module.resource_group.location_out

}

module "azurerm_subnet_network_security_group_association" {
  source = "./nsgassociatetonic"
  subnet_id = module.subnets.subnet_id_out
  network_security_group_id = module.network_security_group.nsg_id_out
}

module "nsg-associate-nic" {
  source = "./nsgtonic"
  nsg_id = module.network_security_group.nsg_id_out
  nic_id = module.network_interface.network_interface_ids_out
}

module "subnets" {
  source           = "./subnets"
  subnet_name      = "terra-subnet"
  resource_group   = module.resource_group.rg_out
  vnet_name        = module.virtual_networks.vnet_name_out
  address_prefixes = ["172.16.10.0/24"]

}

module "network_interface" {
  source         = "./networkinterface"
  nic_name       = "terra-nic-1"
  resource_group = module.resource_group.rg_out
  location       = module.resource_group.location_out
  subnet_id      = module.subnets.subnet_id_out
  public_ip_address_id = module.public_ip.public_ip_out

}

module "azurerm_linux_virtual_machine" {
  source         = "./linux-vm"
  vm_name        = "terra-VM"
  resource_group = module.resource_group.rg_out
  location       = module.resource_group.location_out
  admin_username = "terra"
  admin_password = "Terra@12345"
  size           = "Standard_D2s_v3"

  network_interface_ids = [module.network_interface.network_interface_ids_out]

  offer                = "0001-com-ubuntu-server-jammy"
  publisher            = "Canonical"
  sku                  = "22_04-lts"
  storage_account_type = "Standard_LRS"
  image_version        = "latest"

  

}

module "public_ip" {
  source = "./public-ipaddress"
  public_ip_name = "terra-ip"
  allocation_method = "Static"
  resource_group = module.resource_group.rg_out
  location = module.resource_group.location_out
}



