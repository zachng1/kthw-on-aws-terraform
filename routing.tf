resource "aws_route_table" "kthw_routing" {
  tags = merge(
    tomap({
      "Name"      = "KtHW Route Table",
      "created-by"= var.owner
    }),
    var.custom_tags
  )
  vpc_id = aws_vpc.kthw.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }
}
resource "aws_route_table_association" "nodes_a" {
  subnet_id      = aws_subnet.nodes[0].id
  route_table_id = aws_route_table.kthw_routing.id
}
resource "aws_route_table_association" "nodes_b" {
  subnet_id      = aws_subnet.nodes[1].id
  route_table_id = aws_route_table.kthw_routing.id
}
resource "aws_route_table_association" "nodes_c" {
  subnet_id      = aws_subnet.nodes[2].id
  route_table_id = aws_route_table.kthw_routing.id
}
