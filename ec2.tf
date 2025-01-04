resource "aws_instance" "myweb12" {
  ami             = "ami-0fff1b9a61dec8a5f"
  instance_type   = "t3.micro"
  key_name        = "my-terra-key"
  security_groups = ["allow_tls"]
  tags = {
    Name = "HR"
  }
}

provider "aws" {
region = "eu-north-1"
access_key = "<access-key>"
secret_key = "<secret-key>"
}
