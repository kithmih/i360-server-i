output "s3" {
  value = module.s3.s3
}

output "secret_manager" {
  value = module.secretmanager.secret_manager
}
