resource "aws_iam_user" "app-user" {
  name = "${var.owner}-${var.project}-${var.client.name}-${var.environment}-app-user"
  path = "/applications/house/"

  tags = {
    Project             = var.project
    Environment         = var.environment
    CreatedBy           = var.version_info.v1.createdBy
    CreatedOn           = var.version_info.v1.createdOn
    CreatedByTerraforms = var.version_info.v1.terraformEnabled
    TerraformVersion    = var.version_info.v1.terraformsVersion
  }
}
