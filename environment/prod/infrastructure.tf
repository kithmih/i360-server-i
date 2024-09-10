
module "infrastructure" {

  source = "../../modules/infrastructure"

  account_id   = var.account_id
  region       = var.region
  owner        = var.owner
  project      = var.project
  environment  = var.runtime.env.tick
  version_info = var.version_info
  vpc          = var.vpc

  relative_path = "../../infrastructure"

}

