resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc.cider
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name                = "${var.owner}-${var.project}-${var.environment}-vpc"
    Project             = var.project
    Environment         = var.environment
    CreatedBy           = var.version_info.v1.createdBy
    CreatedOn           = var.version_info.v1.createdOn
    CreatedByTerraforms = var.version_info.v1.terraformEnabled
    TerraformVersion    = var.version_info.v1.terraformsVersion
  }
}

# Internet gateway acts as an exit point for the vpc to access internet
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name                = "${var.owner}-${var.project}-${var.environment}-gateway"
    Project             = var.project
    Environment         = var.environment
    CreatedBy           = var.version_info.v1.createdBy
    CreatedOn           = var.version_info.v1.createdOn
    CreatedByTerraforms = var.version_info.v1.terraformEnabled
    TerraformVersion    = var.version_info.v1.terraformsVersion
  }
}
