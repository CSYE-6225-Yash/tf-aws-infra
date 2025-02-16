# Creating private subnets
resource "aws_subnet" "private_subnets" {
  count             = length(var.private_subnet_cider_blocks)
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = element(element(var.private_subnet_cider_blocks, count.index), 1)
  availability_zone = element(var.availability_zones, count.index)

  tags = {
    Name = element(element(var.private_subnet_cider_blocks, count.index), 0)
  }
}

# Creating public subnets
resource "aws_subnet" "public_subnets" {
  count             = length(var.public_subnet_cider_blocks)
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = element(element(var.public_subnet_cider_blocks, count.index), 1)
  availability_zone = element(var.availability_zones, count.index)

  tags = {
    Name = element(element(var.public_subnet_cider_blocks, count.index), 0)
  }
}