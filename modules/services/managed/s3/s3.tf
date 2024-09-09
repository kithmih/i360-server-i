resource "aws_s3_bucket" "codebuild" {
  bucket        = "${var.owner}-${var.project}-${var.environment}-codebuild-s3"
  force_destroy = true

  tags = {
    Name                = "${var.owner}-${var.project}-${var.environment}-codebuild-s3"
    Project             = var.project
    Environment         = var.environment
    CreatedBy           = var.version_info.v1.createdBy
    CreatedOn           = var.version_info.v1.createdOn
    CreatedByTerraforms = var.version_info.v1.terraformEnabled
    TerraformVersion    = var.version_info.v1.terraformsVersion
  }
}
