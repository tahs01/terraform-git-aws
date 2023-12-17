provider "aws" {
  region = "us-west-2"  # Set your desired AWS region
}

module "vpc" {
  source          = "terraform-aws-modules/vpc/aws"
  version         = "5.1.2"
  cidr            = var.subnet_for_vpc
  azs             = var.availiblity_zone
  private_subnets = var.private_subnets_azs
  public_subnets  = var.public_subnets_azs
}

module "eks_cluster" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "2.0.0"  # Replace with the actual version
  cluster_name    = "my-eks-cluster"
  subnets         = module.vpc.public_subnets
  vpc_id          = module.vpc.vpc_id
  cluster_version = "1.21"
}

resource "kubectl_manifest" "deployment" {
  yaml_body = file("todoap-deployment.yaml")
  depends_on = [module.eks_cluster]
}
