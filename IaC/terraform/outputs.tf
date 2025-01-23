output "cluster_name" {
  description = "The name of the AKS cluster"
  value       = module.aks.cluster_name
}

output "resource_group_name" {
  description = "The name of the resource group containing the AKS cluster"
  value       = module.aks.resource_group_name
}

output "cluster_endpoint" {
  description = "The endpoint for the AKS cluster"
  value       = module.aks.cluster_endpoint
  sensitive   = true
}

output "kube_config" {
  description = "The kubeconfig for the AKS cluster"
  value       = module.aks.kube_config
  sensitive   = true
}
