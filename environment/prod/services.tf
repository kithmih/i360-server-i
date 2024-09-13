module "services" {

  source     = "../../modules/services"
  depends_on = [module.infrastructure]

  region         = var.region
  owner          = var.owner
  project        = var.project
  account_id     = var.account_id
  version_info   = var.version_info
  github         = var.github
  runtime        = var.runtime
  clients        = var.clients
  infrastructure = module.infrastructure
  build          = var.build
  relative_path  = "../../modules/services"

}
