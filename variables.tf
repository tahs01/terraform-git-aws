variable "aws_region" {
  description = "AWS Region to Deploy Resource into"
  type        = string
  default     = "us-east-2"
}

variable "subnet_for_vpc" {
  description = "Subnet for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availiblity_zone" {
  description = "Availibility Zones for VPC"
  type        = list(string)
  default     = ["us-east-2a", "us-east-2b"]
}

variable "private_subnets_azs" {
  description = "Private Subnets for Availibility Zones"
  type        = list(string)
  default     = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "public_subnets_azs" {
  description = "Public Subnets for Availibility Zones"
  type        = list(string)
  default     = ["10.0.2.0/24", "10.0.3.0/24"]
}

variable "eks_cluster" {
  description = "name of cluster"
  type        = string
  default     = "tahs_eks_cluster"
}