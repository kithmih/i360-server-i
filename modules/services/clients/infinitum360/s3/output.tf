
#  to define outputs that can be queried or used by other modules or configurations (this provides information about the aws_s3_bucket.i360 resource)
output "s3" {
  value = {
    backups = aws_s3_bucket.i360
  }
  description = "AWS S3 Storage"
}
