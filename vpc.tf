# Create a VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cider_block

  tags = {
    Name = var.vpc_name
  }
}