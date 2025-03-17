# Creating ec2 instance
resource "aws_instance" "webapp" {
  ami                         = var.machine_image
  instance_type               = var.instance_type
  subnet_id                   = element(aws_subnet.public_subnets[*].id, var.instance_subnet)
  vpc_security_group_ids      = [aws_security_group.application_security_group.id]
  associate_public_ip_address = true
  disable_api_termination     = false
  iam_instance_profile        = aws_iam_instance_profile.webapp_profile.name

  user_data = <<EOF
#!/bin/bash
cd /opt/csye6225/webapp
echo "DATABASE_NAME=${var.dbname}" >> .env
echo "DATABASE_USER=${var.db_username}" >> .env
echo "DATABASE_PASSWORD=${var.db_password}" >> .env
echo "DATABASE_Host=${aws_db_instance.mysql_db_instance.address}" >> .env
echo "DATABASE_PORT=${aws_db_instance.mysql_db_instance.port}" >> .env
echo "BUCKET_NAME=${aws_s3_bucket.my_s3_bucket.id}" >> .env
sudo systemctl start webapp.service
  EOF

  root_block_device {
    volume_size = var.instance_volume_size
    volume_type = var.instance_volume_type
  }

  tags = {
    Name = var.instance_name
  }
}