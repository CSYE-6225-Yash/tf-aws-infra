# Creating security group for application
resource "aws_security_group" "application_security_group" {
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = aws_vpc.my_vpc.id

  tags = {
    Name = var.security_group_name
  }
}

# Adding ingress rules for web application security group
resource "aws_vpc_security_group_ingress_rule" "allow_webapp_ipv4" {
  security_group_id            = aws_security_group.application_security_group.id
  referenced_security_group_id = aws_security_group.load_balancer_security_group.id
  count                        = length(var.security_group_ingress_rule)
  from_port                    = element(var.security_group_ingress_rule[*].from_port, count.index)
  ip_protocol                  = element(var.security_group_ingress_rule[*].protocol, count.index)
  to_port                      = element(var.security_group_ingress_rule[*].to_port, count.index)
}

# Adding egress rule to all ipv4 addresses
resource "aws_vpc_security_group_egress_rule" "allow_webapp_internet_connectivity" {
  security_group_id = aws_security_group.application_security_group.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 0
  ip_protocol = "-1"
  to_port     = 0
}

# Creating security group for database
resource "aws_security_group" "database_security_group" {
  name        = var.db_security_group_name
  description = var.db_security_group_description
  vpc_id      = aws_vpc.my_vpc.id

  tags = {
    Name = var.db_security_group_name
  }
}

# Adding ingress rule to database source from application security group
resource "aws_vpc_security_group_ingress_rule" "allow_db_access" {
  security_group_id            = aws_security_group.database_security_group.id
  referenced_security_group_id = aws_security_group.application_security_group.id
  count                        = length(var.db_security_group_ingress_rule)
  from_port                    = element(var.db_security_group_ingress_rule[*].from_port, count.index)
  ip_protocol                  = element(var.db_security_group_ingress_rule[*].protocol, count.index)
  to_port                      = element(var.db_security_group_ingress_rule[*].to_port, count.index)
}

# Creating security group for load balancer
resource "aws_security_group" "load_balancer_security_group" {
  name        = var.load_balancer_security_group_name
  description = var.load_balancer_security_group_description
  vpc_id      = aws_vpc.my_vpc.id

  tags = {
    Name = var.load_balancer_security_group_name
  }
}

# Adding ingress rule for load balancer security group
resource "aws_vpc_security_group_ingress_rule" "allow_load_balancer_access" {
  security_group_id = aws_security_group.load_balancer_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  count             = length(var.load_balancer_security_group_ingress_rule)
  from_port         = element(var.load_balancer_security_group_ingress_rule[*].from_port, count.index)
  ip_protocol       = element(var.load_balancer_security_group_ingress_rule[*].protocol, count.index)
  to_port           = element(var.load_balancer_security_group_ingress_rule[*].to_port, count.index)
}

resource "aws_vpc_security_group_egress_rule" "allow_load_balancer_internet_egress" {
  security_group_id = aws_security_group.load_balancer_security_group.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 0
  ip_protocol       = "-1"
  to_port           = 0
}