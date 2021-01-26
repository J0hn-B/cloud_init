#*------------------------------------------------
#*   Azure --Create Public IP
#*------------------------------------------------

resource "azurerm_public_ip" "k8s_multi" {
  name                = "k3s-development-01"
  resource_group_name = azurerm_resource_group.k8s_multi.name
  location            = azurerm_resource_group.k8s_multi.location
  allocation_method   = "Static"

  tags = {
    environment = "Development"
  }
}


#*------------------------------------------------
#*   Azure --Create Virtual Network
#*------------------------------------------------

resource "azurerm_virtual_network" "k8s_multi" {
  name                = "k8s-multi-cluster"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.k8s_multi.location
  resource_group_name = azurerm_resource_group.k8s_multi.name
}

resource "azurerm_subnet" "k8s_multi" {
  name                 = "k8s-multi-cluster"
  resource_group_name  = azurerm_resource_group.k8s_multi.name
  virtual_network_name = azurerm_virtual_network.k8s_multi.name
  address_prefixes     = ["10.0.2.0/24"]
}
