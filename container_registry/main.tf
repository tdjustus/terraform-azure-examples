resource "random_id" "random_resource_group_id" {
  prefix      = "azrg" # Azure Resource Group
  byte_length = 4
}

resource "random_id" "random_container_registry_id" {
  prefix      = "azcr" # Azure Container Registry
  byte_length = 4
}

resource "azurerm_resource_group" "rg" {
  name     = random_id.random_resource_group_id.dec
  location = var.location
  tags = {
    deployed_on = timestamp()
  }
}

resource "azurerm_container_registry" "acr" {
  name                = random_id.random_container_registry_id.dec
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = var.container_registry.sku
  admin_enabled       = var.container_registry.admin_enabled
}

output "resource_group_name" {
  description = "The name of the deployed resource group"
  value       = azurerm_resource_group.rg.name
}

output "container_registry_name" {
  description = "The name of the deployed container registry"
  value       = azurerm_container_registry.acr.name
}

output "container_registry_login_server" {
  description = "The login server for the deployed container registry"
  value       = azurerm_container_registry.acr.login_server
}
