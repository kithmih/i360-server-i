module "bookapi" {

  source = "./clients/bookapi"

  region        = var.region
  account       = var.account_id
  owner         = var.owner
  project       = var.project
  version_info  = var.version_info
  client        = var.clients.bookapi
  github        = var.github
  relative_path = "clients/bookapi"

}
