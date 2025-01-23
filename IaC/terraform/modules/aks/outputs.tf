# Output the kube_config for the created AKS cluster
output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
  sensitive = true
}

output "cluster_name" {
  value = azurerm_kubernetes_cluster.aks_cluster.name
}

output "resource_group_name" {
  value = azurerm_resource_group.aks_resource_group.name
}

output "cluster_endpoint" {
  value     = azurerm_kubernetes_cluster.aks_cluster.kube_config.0.host
  sensitive = true
}
