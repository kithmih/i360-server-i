variable "runtime" {
  default = {
    env = {
      tick        = "prod"
      description = "Prod Environment"
    }
    config = {
      profile = "prod"
    }
    log = {
      retention = 1
      path      = "/house/services"
    }
  }
}
