provider "aws" {
  region = var.region
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

module "eks" {
    source  = "terraform-aws-modules/eks/aws"
    version = "~> 19.0"
    cluster_name = "myapp-eks-cluster"
    cluster_version = "1.25"

    cluster_endpoint_public_access  = true

    vpc_id = "VPC-ID"

    subnet_ids = ["subnet-ID1","subnet-ID2"]

    tags = {
        environment = "development"
        application = "myapp"
    }

    eks_managed_node_groups = {
        dev = {
            min_size = 1
            max_size = 3
            desired_size = 2
            instance_types = ["t2.small"]
        }
    }
}

output "cluster_endpoint" {
    value       = module.eks.cluster_endpoint
    description = "The endpoint for your EKS cluster:"
}
