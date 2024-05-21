variable "vm_name" {
  type = string
}

variable "resource_group" {
  type = string
}

variable "location" {
  type = string
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type = string
  sensitive = true
}

variable "network_interface_ids" {
  type = list(string)
}

variable "size" {
  type = string
}

variable "storage_account_type" {
  type = string
}

variable "publisher" {
  type = string
}

variable "sku" {
  type = string
}

variable "image_version" {
  type = string
}

variable "offer" {
  type = string
}

variable "host" {
  type = string
}

variable "user_connection" {
  type = string
}

variable "password_connection" {
  type = string
}

