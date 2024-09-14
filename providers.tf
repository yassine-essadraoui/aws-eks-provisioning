terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "tf-state-eks-2024"
    key    = "eks-tf-state"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.region
}