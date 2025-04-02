# Creating autoscaling group
resource "aws_autoscaling_group" "webapp_autoscaling_group" {
  name                = var.autoscaling_group_name
  default_cooldown    = var.autoscaling_group_cooldown
  min_size            = var.autoscalling_group_min_size
  max_size            = var.autoscalling_group_max_size
  desired_capacity    = var.autoscalling_group_desired_capacity
  target_group_arns   = [aws_lb_target_group.webapp_target_group.arn]
  vpc_zone_identifier = aws_subnet.public_subnets[*].id

  launch_template {
    id = aws_launch_template.webapp_launch_template.id
  }

  tag {
    key                 = "webapp"
    value               = "instance"
    propagate_at_launch = true
  }
}

# Attaching load balancer target group with autoscaling group
resource "aws_autoscaling_attachment" "example" {
  autoscaling_group_name = aws_autoscaling_group.webapp_autoscaling_group.id
  lb_target_group_arn    = aws_lb_target_group.webapp_target_group.arn
}