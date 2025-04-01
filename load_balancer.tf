# Creating load balancer for webapp
resource "aws_lb" "webapp_load_balancer" {
  name               = "webapp-load-balancer"
  load_balancer_type = "application"
  security_groups    = [aws_security_group.load_balancer_security_group.id]
  subnets            = [for subnet in aws_subnet.public_subnets : subnet.id]
}

# Creating target group
resource "aws_lb_target_group" "webapp_target_group" {
  name     = "webapp-target-group"
  port     = 8000
  protocol = "HTTP"
  vpc_id   = aws_vpc.my_vpc.id

  health_check {
    path = "/healthz"
  }
}

# Creating load balancer listener
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.webapp_load_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.webapp_target_group.arn
  }
}