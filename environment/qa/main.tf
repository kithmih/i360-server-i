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
    bucket = "prod-house-terraform"
    key    = "infinitum360/v1/environment/qa/state"
    region = "ap-south-1"
  }
}

provider "aws" {
  region = var.region
}
