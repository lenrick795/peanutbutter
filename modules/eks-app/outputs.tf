output "service_name" {
  value = kubernetes_service.eks_service.metadata[0].name
}

output "deployment_name" {
  value = kubernetes_deployment.eks_app.metadata[0].name
}