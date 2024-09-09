# Private1/Public1 Subnets

# resource "aws_subnet" "subnet-private-1" {
#   vpc_id            = aws_vpc.vpc.id
#   cidr_block        = var.vpc.subnets.private1.cider
#   availability_zone = var.vpc.subnets.private1.region
#   tags = {
#     Name        = "${var.owner}-${var.project}-${var.environment}-subnet-private1-${var.vpc.subnets.private1.region}"
#     Project     = var.project
#     Environment = var.environment
#   }
# }

# resource "aws_subnet" "subnet-public-1" {
#   vpc_id            = aws_vpc.vpc.id
#   cidr_block        = var.vpc.subnets.public1.cider
#   availability_zone = var.vpc.subnets.public1.region
#   tags = {
#     Name        = "${var.owner}-${var.project}-${var.environment}-subnet-public1-${var.vpc.subnets.public1.region}"
#     Project     = var.project
#     Environment = var.environment
#   }
# }

# # Private2/Public2 Subnets
# resource "aws_subnet" "subnet-private-2" {
#   vpc_id            = aws_vpc.vpc.id
#   cidr_block        = var.vpc.subnets.private2.cider
#   availability_zone = var.vpc.subnets.private2.region
#   tags = {
#     Name        = "${var.owner}-${var.project}-${var.environment}-subnet-private2-${var.vpc.subnets.private2.region}"
#     Project     = var.project
#     Environment = var.environment
#   }
# }

# resource "aws_subnet" "subnet-public-2" {
#   vpc_id            = aws_vpc.vpc.id
#   cidr_block        = var.vpc.subnets.public2.cider
#   availability_zone = var.vpc.subnets.public2.region
#   tags = {
#     Name        = "${var.owner}-${var.project}-${var.environment}-subnet-public2-${var.vpc.subnets.public2.region}"
#     Project     = var.project
#     Environment = var.environment
#   }
# }
