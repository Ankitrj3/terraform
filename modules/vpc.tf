# modules in terraform used to create reusable components
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "ankit-vpc"
  cidr = "192.168.0.0/16"

  azs             = ["ap-south-1a", "ap-south-1b"]
  private_subnets = ["192.168.1.0/24", "192.168.2.0/24"]
  public_subnets  = ["192.168.101.0/24", "192.168.102.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = var.env
  }
}