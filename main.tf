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
cluster_name    = "my-eks-cluster"
subnets         = module.vpc.public_subnets  # Replace with your subnet IDs
vpc_id          = module.vpc.vpc_id          # Replace with your VPC ID
cluster_version = "1.21"                     # Set your desired Kubernetes version
}

provider "kubectl" {
config_path = module.eks_cluster.kubeconfig_path
}

resource "kubectl_manifest" "deployment" {
yaml_body = file("todoap-deployment.yaml")  # Path to your deployment.yaml file
depends_on = [module.eks_cluster]
}