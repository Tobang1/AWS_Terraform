# --Loadbalancing/Main-tf ---


resource "aws_lb" "toba_lb" {
  name            = "toba-loadbalancer"
  subnets         = var.public_subnets
  security_groups = [var.public_sg]
  idle_timeout    = 400
}

#--- target group to get randoom uuid ---
resource "aws_lb_target_group" "toba_tg" {
  name     = "toba-lb-tg-${substr(uuid(), 0, 3)}"
  port     = var.tg_port     #80 
  protocol = var.tg_protocol #"HTTP"
  vpc_id   = var.vpc_id
  health_check {
    healthy_threshold   = var.lb_healthy_threshold   #2
    unhealthy_threshold = var.lb_unhealthy_threshold #2
    timeout             = var.lb_timeout             #3
    interval            = var.lb_interval            #30
  }

}

