terraform {
    backend "s3" {
        bucket = "prod-house-terraform"
        key    = "infinitum360/v1/infrastructure/state"
        region = "ap-south-1"
    }
}