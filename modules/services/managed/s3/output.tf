output "s3" {
  value = {
    codebuild = aws_s3_bucket.codebuild
  }
  description = "AWS S3 Storage"
}
