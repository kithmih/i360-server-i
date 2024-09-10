# module "services" {

#   source     = "../../modules/services"
#   depends_on = [module.infrastructure]

#   region         = var.region
#   owner          = var.owner
#   project        = var.project
#   account_id     = var.account_id
#   version_info   = var.version_info
#   routing        = var.routing
#   build          = var.build
#   github         = var.github
#   runtime        = var.runtime
#   keys           = var.keys
#   clients        = var.clients
#   infrastructure = module.infrastructure
#   relative_path  = "../../modules/services"

# }
