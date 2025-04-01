# Creating dns record for load balancer ip
resource "aws_route53_record" "www" {
  zone_id = var.webapp_dns_zone_id
  name    = var.webapp_domain_name
  type    = "A"
  alias {
    name                   = aws_lb.webapp_load_balancer.dns_name
    zone_id                = aws_lb.webapp_load_balancer.zone_id
    evaluate_target_health = true
  }
}