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