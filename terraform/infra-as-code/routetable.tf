#Criando uma route table para ter uma rota ao igw
resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc_lab.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw_lab.id
  }

  tags = {
    Name      = "my-route-table"
    Owner     = "mundodevops@gmail.com"

  }
}

#Criando uma tabela de rodas para associar a subnet public
resource "aws_route_table_association" "my_subnet_public_association" {
  subnet_id      = aws_subnet.my_subnet_public_lab.id
  route_table_id = aws_route_table.my_route_table.id
}
