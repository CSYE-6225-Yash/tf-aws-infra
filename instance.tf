# Creating ec2 instance
resource "aws_instance" "webapp" {
  ami                         = var.machine_image
  instance_type               = var.instance_type
  subnet_id                   = element(aws_subnet.public_subnets[*].id, var.instance_subnet)
  vpc_security_group_ids      = [aws_security_group.application_security_group.id]
  associate_public_ip_address = true
  disable_api_termination     = false

  root_block_device {
    volume_size = var.instance_volume_size
    volume_type = var.instance_volume_type
  }

  tags = {
    Name = var.instance_name
  }
}