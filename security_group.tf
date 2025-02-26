# Creating security group
resource "aws_security_group" "application_security_group" {
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = aws_vpc.my_vpc.id

  tags = {
    Name = var.security_group_name
  }
}

# Adding ingress rules
resource "aws_vpc_security_group_ingress_rule" "allow_webapp_ipv4" {
  security_group_id = aws_security_group.application_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  count             = length(var.security_group_ingress_rule)
  from_port         = element(var.security_group_ingress_rule[*].from_port, count.index)
  ip_protocol       = element(var.security_group_ingress_rule[*].protocol, count.index)
  to_port           = element(var.security_group_ingress_rule[*].to_port, count.index)
}

# Adding egress rule to all ipv4 addresses
resource "aws_vpc_security_group_egress_rule" "example" {
  security_group_id = aws_security_group.application_security_group.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 0
  ip_protocol = "-1"
  to_port     = 0
}