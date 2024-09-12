terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.41.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket = "prod-house-terraform-i"
    key    = "infinitum360/v1/infrastructure/state"
    region = "ap-south-1"
  }
}

provider "aws" {
  region = var.region
}
