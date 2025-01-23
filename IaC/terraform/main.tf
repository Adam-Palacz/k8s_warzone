module "aks" {
  source = "./modules/aks"

  # Optional configurations with default values
  environment        = "dev"
  location           = "North Europe"
  kubernetes_version = "1.30"
  node_count         = 1
  vm_size            = "Standard_B2s"
  min_node_count     = 1
  max_node_count     = 3
  os_disk_size_gb    = 30

  tags = {
    Environment = "Development"
    ManagedBy   = "Terraform"
  }
}
