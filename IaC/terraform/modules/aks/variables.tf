variable "environment" {
  type        = string
  description = "Environment name"
  default     = "dev"
}

variable "location" {
  type        = string
  description = "Azure region"
  default     = "North Europe"
}

variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version"
  default     = "1.26.3"
}

variable "node_count" {
  type        = number
  description = "Number of nodes in the default node pool"
  default     = 1
}

variable "vm_size" {
  type        = string
  description = "Size of the VM for nodes"
  default     = "Standard_B2s"
}

variable "min_node_count" {
  type        = number
  description = "Minimum number of nodes for auto-scaling"
  default     = 1
}

variable "max_node_count" {
  type        = number
  description = "Maximum number of nodes for auto-scaling"
  default     = 3
}

variable "os_disk_size_gb" {
  type        = number
  description = "OS disk size in GB"
  default     = 30
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all resources"
  default     = {}
}
