module "clients" {

  source = "./clients"

  region         = var.region
  account_id     = var.account_id
  infrastructure = var.infrastructure
  runtime       = var.runtime
  owner         = var.owner
  project       = var.project
  version_info  = var.version_info
  clients       = var.clients
  github        = var.github
  build         = var.build
  managed       = module.managed
  relative_path = "${var.relative_path}/clients"
}