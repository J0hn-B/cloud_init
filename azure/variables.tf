#  Resource Group vars
variable "resource_group_name" {
  default = "k3s-multi-cluster"
}

variable "resource_group_location" {
  default = "UK South"
}

# Compute vars
variable "network_interface_name" {
  default = "k3s-development-01-nic"
}

variable "linux_virtual_machine_name" {
  default = "k3s-development-01"
}

variable "linux_virtual_machine_username" {
  default = "adminuser"
}

# Networks vars 
variable "public_ip_name" {
  default = "k3s-development-01"
}

variable "virtual_network_name" {
  default = "k3s-multi-cluster"
}
