# Configure the Kubernetes provider

provider "kubernetes" {
  host                   = azurerm_kubernetes_cluster.aks.kube_config.0.host
  client_certificate     = base64decode(azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate)
  client_key             = base64decode(azurerm_kubernetes_cluster.aks.kube_config.0.client_key)
  cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.aks.kube_config.0.cluster_ca_certificate)

  # Add these lines to use the AKS cluster's kubeconfig
  config_path    = "~/.kube/config"
  config_context = azurerm_kubernetes_cluster.aks.name
}

# Create a Kubernetes namespace
resource "kubernetes_namespace" "nginx" {
  metadata {
    name = "nginx"
  }
}

resource "kubernetes_manifest" "nginx_deployment" {
  manifest = yamldecode(file("${path.module}/k8s/nginx-deployment.yaml"))
}

resource "kubernetes_manifest" "nginx_service" {
  manifest = yamldecode(file("${path.module}/k8s/nginx-service.yaml"))
}
