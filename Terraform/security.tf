# Create security group
resource "azurerm_network_security_group" "KubeSecGroup" {
    name = "sshtraffic"
    location = azurerm_resource_group.rg.location
    resource_group_name = azurerm_resource_group.rg.name
 
    security_rule {
        name                       = "ALLOW_INBOUND_SSH"
        priority                   = 101
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefixes    = var.external_ip
        destination_address_prefix = "*"
     }
    tags = "${var.tags}"
}