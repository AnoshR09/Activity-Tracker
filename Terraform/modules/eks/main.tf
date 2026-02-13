resource "aws_eks_cluster" "name" {
  name     = var.cluster_name
  role_arn = var.cluster_role_arn

  vpc_config {
    subnet_ids = var.subnet_ids
  }
}

resource "aws_eks_node_group" "name" {
  cluster_name    = aws_eks_cluster.name.name
  node_group_name = "dev-eks-node-group"
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.subnet_ids

  capacity_type  = "ON_DEMAND"
  instance_types = ["t3.micro"]
 # ami_type       = "AL2_x86_64"

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  depends_on = [
    aws_eks_cluster.name
  ]
}