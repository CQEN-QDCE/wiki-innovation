#-------------------------------------------------------------------------------
# Application load balancer
resource "aws_lb_target_group" "nlb_tg" {
  name     = "${local.name}-nlb-tg"
  port     = var.aws_ecs_ec2_tg_port
  protocol = "TCP"
  vpc_id   = data.aws_vpc.selected.id
  target_type = "alb"
  health_check {
    enabled             = true
    interval            = 30
    path                = var.aws_ecs_health_check_path
    protocol            = "HTTP"
    timeout             = 6
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = "200-399"
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb" "nlb" {
  name            = "${local.name}-nlb"
  internal        = true
  load_balancer_type = "network"
  subnets         = [data.aws_subnet.web_subnet_a.id, data.aws_subnet.web_subnet_b.id]
}

resource "aws_lb_listener" "nlb_listener_https" {
  load_balancer_arn  = aws_lb.nlb.arn
  port               = var.aws_ecs_ec2_tg_port
  protocol           = "TCP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nlb_tg.arn
  }
}


resource "aws_lb_target_group_attachment" "tg_attachment" {
    target_group_arn = aws_lb_target_group.nlb_tg.arn
    target_id        = aws_alb.alb_appl.arn

    depends_on = [
      aws_alb.alb_appl
  ]
}
