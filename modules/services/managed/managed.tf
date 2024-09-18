module "s3" {
  source       = "./s3"
  owner        = var.owner
  project      = var.project
  environment  = var.runtime.env.tick
  version_info = var.version_info
}