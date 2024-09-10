# output "vpc" {
#   value       = aws_vpc.vpc
#   description = "AWS ECS VPC"
# }

# output "subnets" {
#   value = {
#     private1 = aws_subnet.subnet-private-1
#     private2 = aws_subnet.subnet-private-2
#     private2 = aws_subnet.subnet-private-2
#     private2 = aws_subnet.subnet-private-2
#   }
#   description = "AWS Subnet Groups"
# }

# output "security_groups" {
#   value = {
#     temp   = aws_security_group.temp_security_group
#     local  = aws_security_group.sg_1_allow_all_local
#     public = aws_security_group.sg_2_public_alb
#   }
#   description = "AWS Subnet Groups"
# }

# output "load_balancer" {
#   value = {
#     public1 = {
#       alb = aws_lb.public-alb
#       listener = {
#         http  = aws_lb_listener.http
#         https = aws_lb_listener.https
#       }
#     }
#   }
#   description = "AWS Load Balancers"
# }

# output "ecs_cluster" {
#   value = {
#     primary = aws_ecs_cluster.ecs_cluster
#   }
#   description = "Primary AWS Cluster"
# }
