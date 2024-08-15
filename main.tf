# Configure the Azure provider
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "aks_rg" {
  name     = "aks-test-rg"
  location = "East US"  # Choose the cheapest region for your needs
}

# Create AKS cluster
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-test-cluster"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = "akstest"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"  # This is one of the cheapest VM sizes
  }

  identity {
    type = "SystemAssigned"
  }

  # Disable features to keep it simple and cheap
  addon_profile {
    kube_dashboard {
      enabled = false
    }
  }

  # Use the cheapest possible SKU
  sku_tier = "Free"
}

# Output the kube_config
output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
}
