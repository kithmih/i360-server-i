module "iam" {

  source = "./iam"

  region       = var.region
  account      = var.account
  owner        = var.owner
  project      = var.project
  version_info = var.version_info
  client       = var.client
}

module "build" {

  source = "./build"

  region       = var.region
  account      = var.account
  owner        = var.owner
  project      = var.project
  version_info = var.version_info
  client       = var.client
  iam          = module.iam.iam
  github       = var.github
}

module "ecr" {

  source = "./ecr"

  owner    = var.owner
  project  = var.project
  services = var.client.services
}
