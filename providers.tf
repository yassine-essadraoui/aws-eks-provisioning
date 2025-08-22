terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "tf-state-eks-2025"
    key    = "eks-tf-state"
    region = "eu-west-3"
  }
}

provider "aws" {
  region = var.region
}