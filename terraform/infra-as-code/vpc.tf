#Criando  primeiro a VPC
resource "aws_vpc" "my_vpc_lab" {
  cidr_block       = "10.0.0.0/16"


  tags = {
    Name      = "my-vpc"
    Owner     = "mundodevops@gmail.com"

  }
}