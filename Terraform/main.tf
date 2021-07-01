# Resource Group
resource "azurerm_resource_group" "rg" {
  name = "kubernetes_rg"
  location = var.location
  tags = {
      environment = "Practice Case 2"
  }
}

# Storage Account
resource "azurerm_storage_account" "stAccount" {
    name = "${var.storage_account}"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
    account_tier = "Standard"
    account_replication_type = "LRS"
    tags = {
      environment = "Practice Case 2"
  }
}