resource "random_id" "random_resource_group_id" {
  prefix      = "azrg" # Azure Resource Group
  byte_length = 4
}

resource "random_id" "random_disk_id" {
  prefix      = "azmd" # Azure Managed Disk
  byte_length = 4
}

resource "azurerm_resource_group" "rg" {
  name     = random_id.random_resource_group_id.dec
  location = var.location
  tags = {
    deployed_on = timestamp()
  }
}

resource "azurerm_managed_disk" "md" {
  name                 = random_id.random_disk_id.dec
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_type = var.managed_disk.storage_account_type
  create_option        = "Empty"
  disk_size_gb         = var.managed_disk.disk_size_gb
}

output "resource_group_name" {
  description = "The name of the deployed resource group"
  value       = azurerm_resource_group.rg.name
}

output "managed_disk_name" {
  description = "The name of the deployed managed disk"
  value       = azurerm_managed_disk.md.name
}
