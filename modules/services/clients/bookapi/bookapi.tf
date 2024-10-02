module "s3" {
  source  = "./s3"
  owner   = var.owner
  project = var.project
  #   environment  = var.runtime.env.tick
  environment  = var.environment
  version_info = var.version_info
  client       = var.client
}

module "iam" {
  source       = "./iam"
  account_id   = var.account_id
  region       = var.region
  owner        = var.owner
  project      = var.project
  environment  = var.environment
  managed      = var.managed
  version_info = var.version_info
  client       = var.client
  s3           = module.s3.s3
}

module "codepipeline" {
  source         = "./codepipeline"
  account_id     = var.account_id
  region         = var.region
  owner          = var.owner
  project        = var.project
  environment    = var.environment
  version_info   = var.version_info
  client         = var.client
  infrastructure = var.infrastructure
  github         = var.github
  build          = var.build
  managed        = var.managed
  iam            = module.iam.iam
}

module "ecs" {
  source            = "./ecs"
  region            = var.region
  owner             = var.owner
  project           = var.project
  version_info      = var.version_info
  client            = var.client
  infrastructure    = var.infrastructure
  environment       = var.environment
  managed           = var.managed
  runtime           = var.runtime
  secret_access_key = var.secret_access_key
  access_key        = var.access_key
  s3                = module.s3.s3
  iam               = module.iam.iam
  relative_path     = "${var.relative_path}/ecs"
}

