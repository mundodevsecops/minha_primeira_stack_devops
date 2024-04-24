##Criando uma subnet privada para VPC
resource "aws_subnet" "my_subnet_private_lab" {
  vpc_id     = aws_vpc.my_vpc_lab.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name      = "my-subnet-private"
    Owner     = "mundodevops@gmail.com"

  }
}