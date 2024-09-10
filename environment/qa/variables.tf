variable "runtime" {
  default = {
    env = {
      tick        = "qa"
      description = "QA Environment"
    }
    config = {
      profile = "qa"
    }
    log = {
      retention = 1
      path      = "/house/services"
    }
  }
}
