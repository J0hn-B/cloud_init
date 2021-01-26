#*------------------------------------------------
#*   Azure --Create Network Interface
#*------------------------------------------------

resource "azurerm_network_interface" "k8s_multi" {
  name                = "k3s-development-01-nic"
  location            = azurerm_resource_group.k8s_multi.location
  resource_group_name = azurerm_resource_group.k8s_multi.name

  ip_configuration {
    name                          = "k3s-development"
    subnet_id                     = azurerm_subnet.k8s_multi.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.k8s_multi.id
  }
}



#*------------------------------------------------
#*   Azure --Create Linux Virtual Machine
#*------------------------------------------------

resource "azurerm_linux_virtual_machine" "k8s_multi_01" {
  name                = "k3s-development-01"
  resource_group_name = azurerm_resource_group.k8s_multi.name
  location            = azurerm_resource_group.k8s_multi.location
  size                = "Standard_B1ms"
  admin_username      = "adminuser"
  custom_data         = base64encode(file("../scripts/cloud-init.sh"))
  network_interface_ids = [
    azurerm_network_interface.k8s_multi.id,
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

}
