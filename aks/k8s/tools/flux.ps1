# Install Flux CLI
Write-Host "Installing Flux CLI..."
winget install fluxcd.flux

# Verify the installation
Write-Host "Verifying Flux installation..."
flux --version

# Check if kubectl is installed
if (!(Get-Command kubectl -ErrorAction SilentlyContinue)) {
    Write-Host "kubectl is not installed. Please install kubectl before proceeding."
    exit 1
}

# Check cluster connectivity
Write-Host "Checking cluster connectivity..."
kubectl get nodes

# Bootstrap Flux on the cluster
Write-Host "Bootstrapping Flux on the cluster..."
$GITHUB_USER = Read-Host "Enter your GitHub username"
$GITHUB_REPO = Read-Host "Enter your GitHub repository name"

flux bootstrap github `
  --owner=$GITHUB_USER `
  --repository=$GITHUB_REPO `
  --path=clusters/my-cluster `
  --personal

Write-Host "Flux has been successfully installed and bootstrapped on your cluster."
