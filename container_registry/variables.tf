variable "subscription_id" {
  description = "The Azure subscription for the deployment"
  type        = string
}

variable "location" {
  description = "The Azure region for the deployment"
  type        = string
  default     = "westus2"
}

variable "container_registry" {
  description = "Defines the container registry parameters"
  type = object({
    sku           = string
    admin_enabled = bool
  })
  default = {
    sku           = "Basic"
    admin_enabled = false
  }
}
