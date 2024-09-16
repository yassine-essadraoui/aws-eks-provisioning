module "irsa-ebs-csi" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role-with-oidc"
  version = "5.34.0"

  create_role                   = true
  role_name                     = "EKS-EBS-CSI-ROLE-${module.eks.cluster_name}"
  provider_url                  = module.eks.oidc_provider
  role_policy_arns              = [var.ebs_csi_policy_arn]
  oidc_fully_qualified_subjects = ["system:serviceaccount:kube-system:ebs-csi-controller-sa"]
}

resource "aws_eks_addon" "ebs-csi" {
  cluster_name             = module.eks.cluster_name
  addon_name               = "aws-ebs-csi-driver"
  addon_version            = "v1.28.0-eksbuild.1"
  service_account_role_arn = module.irsa-ebs-csi.iam_role_arn
  configuration_values = jsonencode({
    controller = {
      resources = {
        limits = {
          cpu    = "100m"
          memory = "150Mi"
        }
        requests = {
          cpu    = "10m"
          memory = "15Mi"
        }
      }
    }
  })
  tags = {
    "eks_addon" = "ebs-csi"
    "terraform" = "true"
  }
}

data "aws_availability_zones" "available" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

data "aws_caller_identity" "current" {}

resource "aws_iam_role" "roles" {
  count = length(var.iam_roles)

  name               = var.iam_roles[count.index].iam_role_name
  assume_role_policy = var.iam_roles[count.index].iam_assume_role_policy
}