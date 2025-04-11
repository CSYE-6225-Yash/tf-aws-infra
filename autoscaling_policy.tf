# Creating autoscaling policy for scaling up
resource "aws_autoscaling_policy" "webapp_scale_up_policy" {
  name                   = "scale_up"
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = 1
  autoscaling_group_name = aws_autoscaling_group.webapp_autoscaling_group.name
}

# Creating autoscaling policy for scaling down
resource "aws_autoscaling_policy" "webapp_scale_down_policy" {
  name                   = "scale_down"
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = -1
  autoscaling_group_name = aws_autoscaling_group.webapp_autoscaling_group.name
}

# Creating cloudwatch metric alarm for webapp cpu utilization increase above 9%
resource "aws_cloudwatch_metric_alarm" "webapp_cpu_utilization_above_9" {
  alarm_name          = "webapp-cpu-utilization-above9"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 9
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.webapp_autoscaling_group.name
  }
  alarm_description = "This metric monitors ec2 cpu utilization and triggers alarm if it goes above 9%"
  alarm_actions     = [aws_autoscaling_policy.webapp_scale_up_policy.arn]
}

# Creating cloudwatch metric alarm for webapp cpu utilization decrease below 8%
resource "aws_cloudwatch_metric_alarm" "webapp_cpu_utilization_below_8" {
  alarm_name          = "webapp-cpu-utilization-below8"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 8
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.webapp_autoscaling_group.name
  }
  alarm_description = "This metric monitors ec2 cpu utilization and triggers alarm if it goes below 8%"
  alarm_actions     = [aws_autoscaling_policy.webapp_scale_down_policy.arn]
}