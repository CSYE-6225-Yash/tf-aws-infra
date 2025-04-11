# Creating secret
resource "aws_secretsmanager_secret" "db_secret" {
  name       = "database_secret"
  kms_key_id = aws_kms_key.secret_manager_key.id
}

# Creating random password for database
resource "random_password" "db_password" {
  length  = 16
  special = false
}

# Creating secret version to store database password
resource "aws_secretsmanager_secret_version" "db_pass" {
  secret_id     = aws_secretsmanager_secret.db_secret.id
  secret_string = jsonencode({ dbPass = random_password.db_password.result })
}