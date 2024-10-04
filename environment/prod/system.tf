# AWS Region
variable "region" {
  default = "ap-south-1"
}

# AWS Account ID
variable "account_id" {
  default = "412381760559"
}

#hard coded access_key and secret_access_key [not pushed it to repo]
variable "access_key" {
  default = ""
}

variable "secret_access_key" {
  default = ""
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

# GITHub for code repository
variable "github" {
  default = {
    "user" = "KayVee78"
    "codestar_connection" : "arn:aws:codeconnections:ap-south-1:412381760559:connection/e7a50f84-5edc-4e05-bf0e-f15221a06bcc",
    "config_repository_ssh" : "git@github.com:kithmih/i360-server-i.git"
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
# variable "clients" {
#   default = {
#     microchip = {
#       name = "microchip"
#     }
#     infinitum360 = {
#       name = "infinitum360"
#     }
#   }
# }
