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