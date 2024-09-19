# decodes a JSON string containing credentials (likely database credentials) fetched from AWS Secrets Manager and stores it as a local variable db_creds
# locals {
#   db_creds = jsondecode(
#     data.aws_secretsmanager_secret_version.creds.secret_string
#   )
# }
