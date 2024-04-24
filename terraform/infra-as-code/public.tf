#Criando uma subnet public para VPC
resource "aws_subnet" "my_subnet_public_lab" {
  vpc_id     = aws_vpc.my_vpc_lab.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name      = "my-subnet-public"
    Owner     = "mundodevops@gmail.com"

  }
}