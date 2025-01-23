# Define variables for Azure credentials
variable "subscription_id" {
  type        = string
  description = "Azure Subscription ID"
  sensitive   = true

  validation {
    condition     = can(regex("^[0-9a-f]{8}-([0-9a-f]{4}-){3}[0-9a-f]{12}$", var.subscription_id))
    error_message = "The subscription_id value must be a valid UUID."
  }
}

variable "client_id" {
  type        = string
  description = "Azure Client ID (Service Principal ID)"
  sensitive   = true

  validation {
    condition     = can(regex("^[0-9a-f]{8}-([0-9a-f]{4}-){3}[0-9a-f]{12}$", var.client_id))
    error_message = "The client_id value must be a valid UUID."
  }
}

variable "client_secret" {
  type        = string
  description = "Azure Client Secret (Service Principal Secret)"
  sensitive   = true
}

variable "tenant_id" {
  type        = string
  description = "Azure Tenant ID"
  sensitive   = true

  validation {
    condition     = can(regex("^[0-9a-f]{8}-([0-9a-f]{4}-){3}[0-9a-f]{12}$", var.tenant_id))
    error_message = "The tenant_id value must be a valid UUID."
  }
}
