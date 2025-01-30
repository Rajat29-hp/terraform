resource "aws_instance" "myweb12" {
  ami             = "ami-0fff1b9a61dec8a5f"
  instance_type   = "t3.micro"
  key_name        = "my-terra-key"
  security_groups = ["allow_tls"]
  tags = {
    Name = "HR"
  }
}
