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

variable "build" {
  default = {
    branch = "main"
    notification = {
      sns_topic = "app-builds"
    }
    log = {
      retention = 1
      path      = "/development/house"
    }
  }
}

variable "clients" {
  default = {
    bookapi = {
      name = "book-api"
      # common = {
      #   hostedZoneId   = "" //refer from routing block
      #   certificateArn = "" //refer from routing block
      # }
      runtime = {
        log = {
          retention = 1
          path      = "/bookapi/services"
        }
      }
      services = {
        api = {
          name       = "api"
          autodeploy = true
          codebuild  = true
          build = {
            github_repository = "https://github.com/KayVee78/book-api-practise.git"
            log_retention     = 5
          }
          deploy = {
            template   = "tmpl-api.tpl"
            public_alb = true
            cpu        = "256"
            memory     = "512"
            fargate = {
              weight = 0
            }
            fargate-spot = {
              weight = 1
              base   = 1
            }
          }
          # routing = {
          #   domain        = "" //refer from routing block
          #   create_domain = true
          #   alb_enabled   = true
          #   alb_priority  = 25100
          # }
        }
      }
    }
  }
}
