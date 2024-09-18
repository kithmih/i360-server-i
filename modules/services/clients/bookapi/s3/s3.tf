resource "aws_s3_bucket" "s3-public" {
  bucket = "${var.owner}-${var.project}-${var.client.name}-${var.environment}-public"

  lifecycle {
    prevent_destroy = true

    ignore_changes = [
      bucket
    ]
  }

  tags = {
    Name                = "${var.owner}-${var.project}-${var.client.name}-${var.environment}-public"
    Project             = var.project
    Environment         = var.environment
    CreatedBy           = var.version_info.v1.createdBy
    CreatedOn           = var.version_info.v1.createdOn
    CreatedByTerraforms = var.version_info.v1.terraformEnabled
    TerraformVersion    = var.version_info.v1.terraformsVersion
  }
}

resource "aws_s3_bucket" "s3-private" {
  bucket = "${var.owner}-${var.project}-${var.client.name}-${var.environment}-private"

  lifecycle {
    prevent_destroy = true

    ignore_changes = [
      bucket
    ]
  }

  tags = {
    Name                = "${var.owner}-${var.project}-${var.client.name}-${var.environment}-private"
    Project             = var.project
    Environment         = var.environment
    CreatedBy           = var.version_info.v1.createdBy
    CreatedOn           = var.version_info.v1.createdOn
    CreatedByTerraforms = var.version_info.v1.terraformEnabled
    TerraformVersion    = var.version_info.v1.terraformsVersion
  }
}
