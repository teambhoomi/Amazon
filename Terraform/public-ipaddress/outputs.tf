output "public_ip_out" {
  value = azurerm_public_ip.public-ip.id
}

output "ip" {
  value = azurerm_public_ip.public-ip.ip_address
}