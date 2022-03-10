provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.resource_group_name}-vnet"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  address_space       = var.vnet_address_space
  dns_servers         = var.vnet_dns_servers
  
  tags = var.vnet_tags
}


### Subnets ### 
resource "azurerm_subnet" "private" {
  name                 = "${var.resource_group_name}-subnet_private"
  resource_group_name  = azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_private_tags["address_prefix"]
}




### PUBLIC SUBNET ####
resource "azurerm_subnet" "public" {
  name                 = "${var.resource_group_name}-subnet_public"
  resource_group_name  = azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_public_tags["address_prefix"]
}
