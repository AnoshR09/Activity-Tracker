output "cluster_name" {
    value = aws_eks_cluster.name.name
  
}
output "cluster_endpoint" {
    value = aws_eks_cluster.name.endpoint
  
}