# Creating parameter group
resource "aws_db_parameter_group" "my_pg" {
  name   = var.db_pg_name
  family = var.db_pg_family
}

# Database subnet group
resource "aws_db_subnet_group" "db_subnet_gp" {
  name       = "db_subnet_gp"
  subnet_ids = aws_subnet.private_subnets[*].id

  tags = {
    Name = var.db_subnet_group_name
  }
}

# Creating mysql RDS instance
resource "aws_db_instance" "mysql_db_instance" {
  allocated_storage      = 10
  engine                 = var.db_engine
  instance_class         = var.db_instance_class
  multi_az               = var.db_multizone_deployment
  identifier             = var.db_identifier
  username               = var.db_username
  password               = jsondecode(aws_secretsmanager_secret_version.db_pass.secret_string)["dbPass"]
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_gp.name
  publicly_accessible    = var.db_public_accessible
  db_name                = var.dbname
  parameter_group_name   = aws_db_parameter_group.my_pg.name
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.database_security_group.id]
  storage_encrypted      = true
  kms_key_id             = aws_kms_key.rds_key.arn
}