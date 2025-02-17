# Private route table association
resource "aws_route_table_association" "private_route_table_association" {
  count          = length(var.private_subnet_cider_blocks)
  subnet_id      = element(aws_subnet.private_subnets.id, count.index)
  route_table_id = aws_route_table.private_route_table.id
}

# Public route table association
resource "aws_route_table_association" "public_route_table_association" {
  count          = length(var.public_subnet_cider_blocks)
  subnet_id      = element(aws_subnet.public_subnets[*].id, count.index)
  route_table_id = aws_route_table.public_route_table.id
}