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

variable "clients" {
  default = {
    microchip = {
      name = "microchip"
    }
    infinitum360 = {
      name = "infinitum360"
    }
  }
}
