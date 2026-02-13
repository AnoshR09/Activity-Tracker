variable "cluster_name" {
  type = string
  #default  = "dev-eks-cluster"
}

variable "cluster_role_arn" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "node_group_name" {

  type = string
  default = "dev-eks-node-group"
  
}

variable "node_role_arn" {

  type = string
  
}

variable "scaling_config" {

  type = object({
    min_size     = number
    max_size     = number
    desired_size = number

  })

  default = {
    min_size = 1
    max_size = 5
    desired_size = 1
  }
  
}