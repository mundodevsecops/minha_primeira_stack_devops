#Criando uma Elasti IP para associar na instância
resource "aws_eip" "my_ip" {
  instance = aws_instance.minha_primeira_stack_devops.id
  domain   = "vpc"

    tags = {
    Name = "elastic-ip"
  }
}

resource "aws_instance" "minha_primeira_stack_devops" {
  ami             = "ami-080e1f13689e07408"
  instance_type   = "t2.micro"
  key_name        = "devops"

  subnet_id       = aws_subnet.my_subnet_public_lab.id
  vpc_security_group_ids = [
    aws_security_group.web_server_sg.id
  ]

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install apache2 -y
              sudo systemctl start apache2
              sudo systemctl enable apache2
              sudo chown -R ubuntu:ubuntu /var/www/html
              sudo chmod -R 775 /var/www/html
              sudo echo "<html><body><h1>Hi, this is my first DevOps stack.</h1></body></html>" > /var/www/html/index.html
              sudo systemctl restart apache2
              EOF
    tags = {
        Name = "web-server-iac"
    }
}
 