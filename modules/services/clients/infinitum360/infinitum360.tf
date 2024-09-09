module "s3" {
  source  = "./s3"
  owner   = var.owner
  project = var.project
  #   environment  = var.runtime.env.tick
  environment  = var.environment
  version_info = var.version_info
  client       = var.clients.infinitum360
}
