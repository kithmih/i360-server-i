resource "aws_security_group" "temp_security_group" {
  name = "${var.owner}-${var.project}-${var.environment}-ALLOW-ALL-DANGER-sg"

  description = "Allow All the traffic ingress/egress"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "Allow All traffic across VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow All traffic across VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name                = "${var.owner}-${var.project}-${var.environment}-ALLOW-ALL-DANGER-sg"
    Project             = var.project
    Environment         = var.environment
    CreatedBy           = var.version_info.v1.createdBy
    CreatedOn           = var.version_info.v1.createdOn
    CreatedByTerraforms = var.version_info.v1.terraformEnabled
    TerraformVersion    = var.version_info.v1.terraformsVersion

  }
}
