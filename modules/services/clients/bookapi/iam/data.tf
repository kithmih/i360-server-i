# Build Artifact Bucket
data "aws_s3_bucket" "artifacts" {
  bucket = var.managed.s3.codebuild.id
}
