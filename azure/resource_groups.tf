#*------------------------------------------------
#*   Azure --Create Resource Group
#*------------------------------------------------

resource "azurerm_resource_group" "k8s_multi" {
  name     = var.resource_group_name
  location = var.resource_group_location
}
