# --Loadbalancing/Main-tf ---


resource "aws_lb" "toba_lb" {
    name = "toba-loadbalancer"
    subnets = var.public_subnets
    security_groups =  [var.public_sg]
    idle_timeout = 400
}