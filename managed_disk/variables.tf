variable "subscription_id" {
  description = "The Azure subscription for the deployment"
  type        = string
}

variable "location" {
  description = "The Azure region for the deployment"
  type        = string
  default     = "westus2"
}

variable "managed_disk" {
  description = "Defines the managed disk parameters"
  type = object({
    storage_account_type = string
    disk_size_gb         = number
  })
  default = {
    storage_account_type = "Standard_LRS"
    disk_size_gb         = 32
  }
}