### Bastion: a public IP address is required

resource "azurerm_subnet" "example" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.3.0/24"]
}

resource "azurerm_public_ip" "example" {
  name                = "bastion_pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
    depends_on = [
    azurerm_resource_group.resource_group,
  ]
}

resource "azurerm_bastion_host" "example" {
  name                = "examplebastion"
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.example.id
    public_ip_address_id = azurerm_public_ip.example.id
  }
}