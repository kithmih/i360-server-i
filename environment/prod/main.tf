terraform {
  backend "s3" {
    bucket = "prod-house-terraform"
    key    = "infinitum360/v1/environment/prod/state"
    region = var.region
  }
}

provider "aws" {
  region = var.region
}
