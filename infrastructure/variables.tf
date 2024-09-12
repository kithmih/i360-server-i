# AWS Account ID
variable "account_id" {
  default = "412381760559"
}

variable "region" {
  default = "ap-south-1"
}

# AWS Region
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

# GITHub for code repository
variable "github" {
  default = {
    "codestar_connection" : "arn:aws:codeconnections:ap-south-1:412381760559:connection/e7a50f84-5edc-4e05-bf0e-f15221a06bcc",
    "config_repository_ssh" : "git@github.com:KayVee78/book-api-practise.git"
  }
}

variable "clients" {
  default = {
    bookapi = {
      name = "bookapi"
      services = {
        api = {
          name      = "api"
          codebuild = true
          build = {
            log_retention = 5
            compute_type  = "BUILD_GENERAL1_SMALL"
          }
        }
      }
    }
  }
}
