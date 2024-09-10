# Private Route Table (Main) and association (private route table for internal traffic within the VPC)
resource "aws-route_table" "rt-private" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name                = "${var.owner}-${var.project}-${var.environment}-rt-private"
    Project             = var.project
    Environment         = var.environment
    CreatedBy           = var.version_info.v1.createdBy
    CreatedOn           = var.version_info.v1.createdOn
    CreatedByTerraforms = var.version_info.v1.terraformEnabled
    TerraformVersion    = var.version_info.v1.terraformsVersion
  }

}


resource "aws_main_route_table_association" "main-rt-association" {
  vpc_id         = aws_vpc.vpc.id
  route_table_id = aws_route_table.rt-private.id
}


# Public Route table which is assigned a subnet by each region
resource "aws_route_table" "rt-public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name                = "${var.owner}-${var.project}-${var.environment}-rt-public"
    Project             = var.project
    Environment         = var.environment
    CreatedBy           = var.version_info.v1.createdBy
    CreatedOn           = var.version_info.v1.createdOn
    CreatedByTerraforms = var.version_info.v1.terraformEnabled
    TerraformVersion    = var.version_info.v1.terraformsVersion
  }
}

#
# REGION 1 subnets
#

resource "aws_route_table" "rt-private-1" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name                = "${var.owner}-${var.project}-${var.environment}-rt-private1-${var.vpc.subnets.private1.region}"
    Project             = var.project
    Environment         = var.environment
    CreatedBy           = var.version_info.v1.createdBy
    CreatedOn           = var.version_info.v1.createdOn
    CreatedByTerraforms = var.version_info.v1.terraformEnabled
    TerraformVersion    = var.version_info.v1.terraformsVersion
  }
}

resource "aws_route_table_association" "association-private-1" {
  subnet_id      = aws_subnet.subnet-private-1.id
  route_table_id = aws_route_table.rt-private-1.id
}

resource "aws_route_table_association" "association-public-1" {
  subnet_id      = aws_subnet.subnet-public-1.id
  route_table_id = aws_route_table.rt-public.id
}


#
# REGION 2 subnets
# 

resource "aws_route_table" "rt-private-2" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name                = "${var.owner}-${var.project}-${var.environment}-rt-private2-${var.vpc.subnets.private2.region}"
    Project             = var.project
    Environment         = var.environment
    CreatedBy           = var.version_info.v1.createdBy
    CreatedOn           = var.version_info.v1.createdOn
    CreatedByTerraforms = var.version_info.v1.terraformEnabled
    TerraformVersion    = var.version_info.v1.terraformsVersion
  }
}

resource "aws_route_table_association" "association-private-2" {
  subnet_id      = aws_subnet.subnet-private-2.id
  route_table_id = aws_route_table.rt-private-2.id
}

resource "aws_route_table_association" "association-public-2" {
  subnet_id      = aws_subnet.subnet-public-2.id
  route_table_id = aws_route_table.rt-public.id
}
