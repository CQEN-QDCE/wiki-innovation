#-------------------------------------------------------------------------------
# Application load balancer
resource "aws_alb_target_group" "alb_tg_http" {
  name     = "${local.name}-alb-tg"
  port     = var.aws_ecs_ec2_tg_port
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.selected.id
  target_type = "ip"
  lifecycle {
    create_before_destroy = true
  }
  health_check {
    enabled             = true
    interval            = 30
    path                = var.aws_ecs_health_check_path
    protocol            = "HTTP"
    timeout             = 10
    healthy_threshold   = 5
    unhealthy_threshold = 3
    matcher             = "200"
  }
}

resource "aws_alb" "alb_appl" {
  name            = "${local.name}-alb"
  internal        = true
  subnets         = [data.aws_subnet.web_subnet_a.id, data.aws_subnet.web_subnet_b.id]
  security_groups = [aws_security_group.security_group.id, data.aws_security_group.web_sg.id, data.aws_security_group.app_sg.id]
}

resource "aws_lb_listener" "alb_listener_https" {
  load_balancer_arn  = aws_alb.alb_appl.arn
  port               = var.aws_ecs_ec2_tg_port
  protocol           = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.alb_tg_http.arn
  }
}