module "bookapi" {
  source = "./bookapi"
  count  = try(var.clients.bookapi, "") != "" ? 1 : 0

  account_id     = var.account_id
  region         = var.region
  owner          = var.owner
  project        = var.project
  environment    = var.runtime.env.tick
  runtime        = var.runtime
  version_info   = var.version_info
  client         = var.clients.bookapi
  infrastructure = var.infrastructure
  github         = var.github
  build          = var.build
  managed        = var.managed
  relative_path  = "${var.relative_path}/bookapi"
}
