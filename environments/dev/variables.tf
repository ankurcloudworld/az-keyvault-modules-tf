variable "client_id" {
  description = "Azure Service Principal Client ID"
  type        = string
}

variable "client_secret" {
  description = "Azure Service Principal Client Secret"
  type        = string
  sensitive   = true
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "sample-rg-dev"
}

variable "location" {
  description = "Azure region for the resources"
  type        = string
  default     = "East US"
}

variable "key_vault_name" {
  description = "The name of the Key Vault."
  type        = string
  default     = "sample-key-vault-dev"
}


variable "object_id" {
  description = "The object ID of the user or service principal to grant access to the Key Vault."
  type        = string
}