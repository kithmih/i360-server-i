# resource "aws_vpc" "vpc" {
#   cidr_block           = var.vpc.cider
#   instance_tenancy     = "default"
#   enable_dns_hostnames = true
#   enable_dns_support   = true
#   tags = {
#     Name = "${var.owner}-${var.project}-${var.environment}-vpc"
#   }
# }
