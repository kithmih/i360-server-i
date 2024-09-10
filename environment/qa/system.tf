# AWS Region
variable "region" {
  default = "ap-south-1"
}

# AWS Account ID
variable "account_id" {
  default = "412381760559"
}

variable "owner" {
  default = "tf"
}

# Project Name
variable "project" {
  default = "house"
}

variable "version_info" {
  default = {
    "v1" = {
      createdBy         = "kithmi"
      createdOn         = "09/09/2024"
      terraformEnabled  = "yes"
      terraformsVersion = "5.20.0"
    }
  }
}

variable "vpc" {
  default = {
    "cider" = "10.0.0.0/16"
    "subnets" = {
      "public1" = {
        region = "ap-south-1a"
        cider  = "10.0.0.0/20"
      }
      "private1" = {
        region = "ap-south-1a"
        cider  = "10.0.16.0/20"
      }
      "public2" = {
        region = "ap-south-1b"
        cider  = "10.0.32.0/20"
      }
      "private2" = {
        region = "ap-south-1b"
        cider  = "10.0.48.0/20"
      }
    }
  }
}
