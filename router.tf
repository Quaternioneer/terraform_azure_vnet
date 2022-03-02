/*resource "azurerm_route_table" "router" {
  name                = "router"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
}

#The routes are numbered such that the first digit is where the route is coming from and the nex digit is to
resource "azurerm_route" "route12" {
  name                = "acceptanceTestRoute1"
  resource_group_name = azurerm_resource_group.resource_group.name
  route_table_name    = azurerm_route_table.router.name
  address_prefix      = "10.0.1.0/24"
  next_hop_type       = "VirtualAppliance"
  next_hop_in_ip_address = azurerm_lb.test.private_ip_address
}

resource "azurerm_subnet_route_table_association" "route12" {
  subnet_id      = azurerm_subnet.public.id
  route_table_id = azurerm_route_table.router.id
}*/

resource "azurerm_route_table" "router" {
  name                          = "route-table"
  location                      = azurerm_resource_group.resource_group.location
  resource_group_name           = azurerm_resource_group.resource_group.name
  disable_bgp_route_propagation = false

  route {
    name           = "route12"
    address_prefix = "10.0.2.0/24"
    next_hop_type  = "VirtualAppliance"
      next_hop_in_ip_address = azurerm_lb.test.private_ip_address
  }
  tags = {
    environment = "testing"
  }
}

resource "azurerm_subnet_route_table_association" "route12" {
  subnet_id      = azurerm_subnet.public.id
  route_table_id = azurerm_route_table.router.id
}