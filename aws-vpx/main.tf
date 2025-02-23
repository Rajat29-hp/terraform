resource "aws_vpc" "main" {
  cidr_block= var.vpc_cidr_block
  
   tags = {
    Name = local.env
  }
}
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${local.env}-igw"
  }
}
resource "aws_subnet" "new-subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_vpc_cidr_block
  map_public_ip_on_launch = true

  tags = {
    Name = "${local.env}-public-subnet"
  }
}
resource "aws_route_table" "example" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = var.route_table_cidr_block
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags = {
    Name = "${local.env}-rt"
  }
}
resource "aws_route_table_association" "a" {
  route_table_id = aws_route_table.example.id
  subnet_id      = aws_subnet.new-subnet.id
 
}
resource "aws_security_group" "new-tf-sg" {
  name        = "dynamic-sg"
  vpc_id= aws_vpc.main.id
  dynamic "ingress"{
    for_each= var.port-rule
    content{
       from_port= ingress.value
       to_port= ingress.value
       protocol= "tcp"
       cidr_blocks= ["0.0.0.0/0"]
   }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_instance" "new-ec2" {
  ami           = "ami-0ebfd941bbafe70c6"
  key_name      = "new-tf-key"
  vpc_security_group_ids = [aws_security_group.new-tf-sg.id]
  subnet_id     = aws_subnet.new-subnet.id
  instance_type = "t2.micro"
   
  user_data= <<-EOF
   #!/bin/bash
   sudo yum install httpd -y
   sudo systemctl enable --now httpd.service
   sudo echo "<h1>Hello World $(hostname -f)</h1>">/var/www/html/index.html
 EOF
  tags = {
    Name = "ServerA"
  }

}
