# Creating parameter group
resource "aws_db_parameter_group" "my_pg" {
  name   = var.db_pg_name
  family = var.db_pg_family
}

# Creating mysql RDS instance
resource "aws_db_instance" "mysql_db_instance" {
  engine               = var.db_engine
  instance_class       = var.db_instance_class
  multi_az = var.db_multizone_deployment
  identifier = var.db_identifier
  username             = var.db_username
  password             = var.db_password
  db_subnet_group_name = element(aws_subnet.private_subnets[*].name, var.db_subnet)
  publicly_accessible = var.db_public_accessible
  db_name              = var.dbname
  parameter_group_name = aws_db_parameter_group.my_pg.name
}