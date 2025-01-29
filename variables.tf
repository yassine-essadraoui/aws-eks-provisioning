variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_name" {
  description = "your vpc name"
  type        = string
  default     = ""
}

variable "vpc_cidr_range" {
  type    = string
  default = ""
}

variable "enable_nat_gateway" {
  type    = bool
  default = false
}

variable "single_nat_gateway" {
  type    = bool
  default = true
}

variable "enable_dns_hostnames" {
  type    = bool
  default = true
}

variable "cluster_name" {
  description = "your eks cluster name"
  type        = string
  default     = ""
}

variable "ebs_csi_policy_arn" {
  description = "AWS managed EBS CSI policy arn"
  type        = string
  default     = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
}

variable "iam_roles" {
  type = list(object({
    iam_role_name          = string
    iam_assume_role_policy = string
  }))
}

variable "eks_managed_node_groups" {
  type = map(object({
    name           = string
    instance_types = list(string)
    min_size       = number
    max_size       = number
    desired_size   = number
  }))
  default = {
    ondemand1 = {
      name           = "mng-1"
      instance_types = ["t2.micro"]
      min_size       = 1
      max_size       = 2
      desired_size   = 2
    }

    ondemand2 = {
      name           = "mng-2"
      instance_types = ["t2.micro"]
      min_size       = 1
      max_size       = 2
      desired_size   = 2
    }
  }
}

variable "enable_cluster_creator_admin_permissions" {
  type    = bool
  default = false
}

variable "cluster_version" {
  type    = string
  default = "1.32"
}