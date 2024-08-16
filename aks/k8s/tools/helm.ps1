# Install Helm on Windows
$ProgressPreference = 'SilentlyContinue'
Invoke-WebRequest -UseBasicParsing -Uri https://get.helm.sh/helm-v3.10.2-windows-amd64.zip -OutFile helm.zip
Expand-Archive -Path helm.zip -DestinationPath ".\helm"
$helmExePath = Join-Path -Path (Get-Location) -ChildPath "helm\windows-amd64\helm.exe"
$env:Path += ";$((Get-Item $helmExePath).Directory.FullName)"
Remove-Item -Path helm.zip -Force

# Add Helm repositories
helm repo add stable https://charts.helm.sh/stable
helm repo update