#This is for iam_role
resource "aws_iam_role" "test_role_engg" {
    name = "test_role_engg"
    assume_role_policy = <<EOF
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Action": "sts:AssumeRole",
                "Principal": {
                    "Service": "ec2.amazonaws.com"
                },
                "Effect": "Allow",
                "Sid": ""
            }
        ]
    }
    EOF
    tags = {
        Name = "EC2-SSM-CloudWatch-ECR-Role"
    }    
}

# Attach AWS managed policy for SSM
resource "aws_iam_role_policy_attachment" "ssm_policy" {
    role       = aws_iam_role.test_role_engg.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

# Attach AWS managed policy for CloudWatch Agent
resource "aws_iam_role_policy_attachment" "cloudwatch_agent_policy" {
    role       = aws_iam_role.test_role_engg.name
    policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

# Attach AWS managed policy for ECR read access
resource "aws_iam_role_policy_attachment" "ecr_read_policy" {
    role       = aws_iam_role.test_role_engg.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

# Create instance profile for EC2
resource "aws_iam_instance_profile" "ec2_profile" {
    name = "ec2-ssm-cloudwatch-ecr-infra-profile"
    role = aws_iam_role.test_role_engg.name
}

# iam role for eks control plane
resource "aws_iam_role" "eks_cluster_role" {
    name = "eks_cluster_role"
    assume_role_policy = <<EOF
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Principal": {
                    "Service": "eks.amazonaws.com"
                },
                "Action": "sts:AssumeRole"
            }
        ]
    }
    EOF
        tags = {
        Name = "EKS-Control-Plane-Role"
    }  
}
  
# attach required role policies for eks
resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
    role       = aws_iam_role.eks_cluster_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

# iam role for eks node group
resource "aws_iam_role" "eks_node_group_role" {
    name = "eks_node_group_role"
    assume_role_policy = <<EOF
    {
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Principal": {
                    "Service": "ec2.amazonaws.com"
                },
                "Action": "sts:AssumeRole"
            }
        ]
    }
    EOF
        tags = {
        Name = "EKS-Node-Group-Role"
    }  
}

# attach required role policies for eks node group
resource "aws_iam_role_policy_attachment" "eks_worker_node_policy" {
    role       = aws_iam_role.eks_node_group_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}
resource "aws_iam_role_policy_attachment" "nodegroup_cni_policy" {
    role       = aws_iam_role.eks_node_group_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"  
}
resource "aws_iam_group_policy_attachment" "nodegroup_ecr_policy" {
    group      = aws_iam_role.eks_node_group_role.name
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  
}