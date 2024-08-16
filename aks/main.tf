# This Terraform configuration creates an Azure Kubernetes Service (AKS) cluster.


# Create a resource group to host the AKS cluster
resource "azurerm_resource_group" "aks_rg" {
  name     = "aks-test-rg"
  location = "northeurope"
}

# Create the AKS cluster
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-test-cluster"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = "akstest"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }

  sku_tier = "Free"
}

# Output the kube_config for the created AKS cluster
output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}
