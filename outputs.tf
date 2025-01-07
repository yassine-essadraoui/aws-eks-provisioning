output "cluster_id" {
  description = "The id of the EKS cluster."
  value       = module.eks.cluster_id
}

output "cluster_arn" {
  description = "The ARN of the EKS cluster."
  value       = module.eks.cluster_arn
}

output "cluster_endpoint" {
  description = "The Endpoint of the EKS cluster."
  value       = module.eks.cluster_endpoint
}

output "cluster_access_entries" {
  description = "The Access Entries of the EKS cluster."
  value       = module.eks.access_entries
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnets_cidr_blocks" {
  value = module.vpc.private_subnets_cidr_blocks
}

output "public_subnets_cidr_blocks" {
  value = module.vpc.public_subnets_cidr_blocks
}

output "cluster_oidc_issuer_url" {
  value = module.eks.cluster_oidc_issuer_url
}