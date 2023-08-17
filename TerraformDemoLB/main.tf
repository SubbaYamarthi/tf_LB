
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "East US"
}

resource "azurerm_public_ip" "example" {
  name                = "example-publicip"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  allocation_method   = "Static"
}

resource "azurerm_lb" "example" {
  name                = "example-lb"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location

  frontend_ip_configuration {
    name                 = "example-lb-frontend"
    public_ip_address_id = azurerm_public_ip.example.id
  }
}
