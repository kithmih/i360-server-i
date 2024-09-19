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

resource "aws_security_group" "sg_2_public_alb" {
  name = "${var.owner}-${var.project}-${var.environment}-public_alb-sg"

  description = "Allow All public trafic on HTTP/HTTPS ports"
  vpc_id      = aws_vpc.vpc.id

  //In Traffic
  ingress {
    description      = "Allow HTTP Traffic"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "Allow HTTPS Traffic"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name                = "${var.owner}-${var.project}-${var.environment}-public_alb-sg_"
    Project             = var.project
    Environment         = var.environment
    CreatedBy           = var.version_info.v1.createdBy
    CreatedOn           = var.version_info.v1.createdOn
    CreatedByTerraforms = var.version_info.v1.terraformEnabled
    TerraformVersion    = var.version_info.v1.terraformsVersion
  }
}
