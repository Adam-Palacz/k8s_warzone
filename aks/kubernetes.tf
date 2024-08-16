# # # # Configure the Kubernetes provider


# # # provider "kubernetes" {
# # #   host                   = azurerm_kubernetes_cluster.aks.kube_config.0.host
# # #   client_certificate     = base64decode(azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate)
# # #   client_key             = base64decode(azurerm_kubernetes_cluster.aks.kube_config.0.client_key)
# # #   cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.aks.kube_config.0.cluster_ca_certificate)

# # # Add these lines to use the AKS cluster's kubeconfig
# # # config_path    = "~/.kube/config"
# # # config_context = azurerm_kubernetes_cluster.aks.name
# # # }

# # # resource "kubernetes_manifest" "nginx_deployment" {
# # #   manifest = yamldecode(file("${path.module}/k8s/nginx-deployment.yaml"))
# # # }

# # # resource "kubernetes_manifest" "nginx_service" {
# # #   manifest = yamldecode(file("${path.module}/k8s/nginx-service.yaml"))
# # # }

# provider "kubernetes" {
#   host                   = azurerm_kubernetes_cluster.aks.kube_config.0.host
#   client_certificate     = base64decode(azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate)
#   client_key             = base64decode(azurerm_kubernetes_cluster.aks.kube_config.0.client_key)
#   cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.aks.kube_config.0.cluster_ca_certificate)
# }

# provider "helm" {
#   kubernetes {
#     host                   = azurerm_kubernetes_cluster.aks.kube_config.0.host
#     client_certificate     = base64decode(azurerm_kubernetes_cluster.aks.kube_config.0.client_certificate)
#     client_key             = base64decode(azurerm_kubernetes_cluster.aks.kube_config.0.client_key)
#     cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.aks.kube_config.0.cluster_ca_certificate)  
#   }
# }
# # Create a Kubernetes namespace
# resource "kubernetes_namespace" "nginx" {
#   metadata {
#     name = "nginx"
#   }
#   depends_on = [azurerm_kubernetes_cluster.aks]
# }

# resource "helm_release" "nginx" {
#   name      = "nginx"
#   chart     = "${path.module}/k8s/nginx-chart" 
#   namespace = kubernetes_namespace.nginx.metadata[0].name

#   # Opcjonalnie: ustaw wartości z pliku values.yaml
#   values = [
#     file("${path.module}/k8s/nginx-chart/values.yaml")
#   ]
# }