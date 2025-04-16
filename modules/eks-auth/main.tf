resource "aws_eks_access_entry" "main" {
  cluster_name  = var.eks_cluster.cluster_name
  principal_arn = var.principal_arn
}

resource "aws_eks_access_policy_association" "main" {
  cluster_name  = var.eks_cluster.cluster_name
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
  principal_arn = var.principal_arn

  access_scope {
    type = "cluster"
  }
}
