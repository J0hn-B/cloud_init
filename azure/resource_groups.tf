#*------------------------------------------------
#*   Azure --Create Resource Group
#*------------------------------------------------

resource "azurerm_resource_group" "k8s_multi" {
  name     = "k8s-multi-cluster"
  location = "UK South"
}
