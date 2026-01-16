# calls the vpc module to create a VPC for the dev environment
module "vpc" {
    source = "../../modules/vpc"
}

#calls the subnet module to create subnets for the dev environment
module "subnets" {
    source = "../../modules/subnets"
    vpc_id = module.vpc.vpc_id
}

# calls the security group module to create security groups for the dev environment
module "security_groups" {
    source = "../../modules/security_groups"
    vpc_id = module.vpc.vpc_id
    vpc_cidr = module.vpc.vpc_cidr
}

# calls the ec2_instances module to create EC2 instances for the dev environment
module "ec2_instances" {
    source = "../../modules/ec2_instances"
    subnet_id = module.subnets.public_subnet_id
    security_group_id = module.security_groups.security_group_id
}

# calls the s3_bucket module to create S3 buckets for the dev environment
module "s3_buckets" {
    source = "../../modules/s3_buckets"
}

# calls the rds_instance module to create RDS instances for the dev environment
# module "rds_instance" {
#     source = "../../modules/rds_instance"
# }

# calls the iam_roles module to create IAM roles for the dev environment
 module "iam_roles" {
     source = "../../modules/iam_roles"
 }

module "eks" {
    source = "../../modules/eks"

    cluster_name     = "dev-eks-cluster"
    cluster_role_arn = aws_iam_role.eks_cluster_role.arn
    subnet_id        = module.subnets.private_subnet_id
  
}






