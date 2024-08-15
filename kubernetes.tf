resource "kubernetes_manifest" "nginx_deployment" {
  manifest = yamldecode(file("${path.module}/k8s/nginx-deployment.yaml"))
}

resource "kubernetes_manifest" "nginx_service" {
  manifest = yamldecode(file("${path.module}/k8s/nginx-service.yaml"))
}
