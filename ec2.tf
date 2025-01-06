resource "aws_instance" "myweb12" {
  ami             = "ami-0fff1b9a61dec8a5f"
  instance_type   = "t2.micro"
  key_name        = "terraform-key"
  security_groups = ["new-sg-tf"]
  tags = {
    Name = "HR"
  }
}

provider "aws" {
region = "eu-north-1"
access_key = "<access-key>"
secret_key = "<secret-key>"
}
