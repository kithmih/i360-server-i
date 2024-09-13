resource "aws_s3_bucket" "i360" {
  bucket        = "${var.owner}-${var.project}-${var.environment}-s3-${var.client.name}-${var.client.erp.name}"
  force_destroy = true

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name                = "${var.owner}-${var.project}-${var.environment}-s3-${var.client.name}-${var.client.erp.name}"
    Project             = var.project
    Environment         = var.environment
    CreatedBy           = var.version_info.v1.createdBy
    CreatedOn           = var.version_info.v1.createdOn
    CreatedByTerraforms = var.version_info.v1.terraformEnabled
    TerraformVersion    = var.version_info.v1.terraformsVersion
  }
}
