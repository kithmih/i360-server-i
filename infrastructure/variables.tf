# AWS Account ID
variable "account_id" {
  default = "412381760559"
}

variable "region" {
  default = "ap-south-1"
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
      createdOn         = "13/10/2024"
      terraformEnabled  = "yes"
      terraformsVersion = "5.20.0"
    }
  }
}

# GITHub for code repository
variable "github" {
  default = {
    "user" = "KayVee78"
    # CodeConnection ARN is given for codestar_connection
    "codestar_connection" : "arn:aws:codeconnections:ap-south-1:412381760559:connection/e7a50f84-5edc-4e05-bf0e-f15221a06bcc",
    "config_repository_ssh" : "git@github.com:kithmih/i360-server-i.git"
  }
}

variable "clients" {
  default = {
    bookapi = {
      name = "book-api"
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
