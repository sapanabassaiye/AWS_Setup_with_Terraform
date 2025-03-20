resource "aws_lb_target_group" "alb_tg" {
  name     = "${var.alb_name}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

resource "aws_lb_target_group_attachment" "private_instance_1" {
  target_group_arn = aws_lb_target_group.alb_tg.arn
  target_id        = aws_instance.private_instance_1.id
  port             = 80
}
