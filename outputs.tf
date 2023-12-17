output "vpc_id" {
  description = "The ID of VPC"
  value       = module.vpc.vpc_id
}

output "private_subnets_ids" {
  description = "Private Subnets IDs"
  value       = module.vpc.private_subnets
}