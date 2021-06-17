# Create network
resource "azurerm_virtual_network" "myNet" {
  name = "Kubernetes-Network"
  address_space = ["10.0.0.0/16"]
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags = "${var.tags}"
}

# Create subnet
resource "azurerm_subnet" "mySubNet" {
  name = "Kubernetes-Subnet"
  resource_group_name = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.myNet.name
  address_prefixes = ["10.0.1.0/24"]
}

# Create NICs
resource "azurerm_network_interface" "myNic" {
  name = "vmnic-${count.index}"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  ip_configuration {
    name = "myipconfiguration1"
    subnet_id = azurerm_subnet.mySubNet.id
    private_ip_address_allocation = "Static"
    private_ip_address = "10.0.1.${count.index + 10}"
    public_ip_address_id = element(azurerm_public_ip.myPublicIp.*.id, count.index)
  }
 tags = "${var.tags}"  
 count = 4
}

# Create public IP
resource "azurerm_public_ip" "myPublicIp" {
  name = "vmip-${count.index}"
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method = "Dynamic"
  sku = "Basic"
  tags = "${var.tags}"
  count = 4
}