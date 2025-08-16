terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }


backend "s3" {
    bucket = "awsremoteinfrabucket"
    key = "terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "backend_infra_table"
}
# we used remote-state locking concept to prevent concurrent operations on the same state file
}