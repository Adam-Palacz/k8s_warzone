# This Terraform configuration creates an Azure Kubernetes Service (AKS) cluster.

# Create a resource group to host the AKS cluster
resource "azurerm_resource_group" "aks_resource_group" {
  name     = "aks-${var.environment}-rg"
  location = var.location
  tags     = var.tags
}

# Create the AKS cluster
resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "aks-${var.environment}-cluster"
  location            = azurerm_resource_group.aks_resource_group.location
  resource_group_name = azurerm_resource_group.aks_resource_group.name
  dns_prefix          = "aks${var.environment}cluster"
  kubernetes_version  = var.kubernetes_version

  default_node_pool {
    name                = "default"
    node_count          = var.node_count
    vm_size             = var.vm_size
    enable_auto_scaling = true
    min_count           = var.min_node_count
    max_count           = var.max_node_count
    os_disk_size_gb     = var.os_disk_size_gb
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }

  tags = var.tags
}

# Install Ingress Controller using Helm
resource "helm_release" "ingress_nginx" {
  name             = "ingress-nginx"
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  namespace        = "ingress-nginx"
  create_namespace = true

  depends_on = [azurerm_kubernetes_cluster.aks_cluster]
}

# Install Cert-Manager using Helm
resource "helm_release" "cert_manager" {
  name             = "cert-manager"
  repository       = "https://charts.jetstack.io"
  chart            = "cert-manager"
  namespace        = "cert-manager"
  create_namespace = true

  set {
    name  = "installCRDs"
    value = "true"
  }

  depends_on = [azurerm_kubernetes_cluster.aks_cluster]
}
