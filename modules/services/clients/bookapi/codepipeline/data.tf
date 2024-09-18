# Build Artifact Bucket
#retrieves information about an existing S3 bucket that will be used to store build artifacts for a CodeBuild project
data "aws_s3_bucket" "artifacts" {
  bucket = var.managed.s3.codebuild.id
}