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
     connection {
        host = "52.169.7.111"
        type = "ssh"
        user = "Jenkins-Master"
        password = "Jenkins@12345"
      }

      provisioner "remote-exec" {
      inline = [
        "sudo apt update",
        "sudo apt-get install openjdk-17-jdk -y",
        "sudo apt-get install maven -y",
        "sudo apt-get install net-tools -y",
        "sudo wget -O /usr/share/keyrings/jenkins-keyring.ascm https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key",
        "echo 'deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]' https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null",
        "sudo apt-get update",
        "sudo apt-get install jenkins",
        "wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg",
        "echo 'deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main' | sudo tee /etc/apt/sources.list.d/hashicorp.list",
        "sudo apt update && sudo apt install terraform"
       ]
     
    }
}