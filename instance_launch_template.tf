resource "aws_launch_template" "webapp_launch_template" {
  image_id                = var.machine_image
  instance_type           = var.instance_type
  disable_api_termination = false
  key_name                = var.ssh_key_name
  name                    = var.launch_template_name

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = var.instance_volume_size
      volume_type = var.instance_volume_type
      encrypted   = true
      kms_key_id  = aws_kms_key.ec2_key.arn
    }
  }

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.application_security_group.id]
  }

  iam_instance_profile {
    name = aws_iam_instance_profile.webapp_profile.name
  }

  user_data = base64encode(templatefile("${path.module}/user_data_script.sh", { dbname = var.dbname, db_username = var.db_username, db_host = aws_db_instance.mysql_db_instance.address, db_port = aws_db_instance.mysql_db_instance.port, bucket_name = aws_s3_bucket.my_s3_bucket.id, secret_id = aws_secretsmanager_secret.db_secret.arn }))
}