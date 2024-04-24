#Criando um igw para anexá-lo ao VPC.
resource "aws_internet_gateway" "my_igw_lab" {
  vpc_id = aws_vpc.my_vpc_lab.id

  tags = {
    Name      = "my-igw"
    Owner     = "mundodevops@gmail.com"

  }
}