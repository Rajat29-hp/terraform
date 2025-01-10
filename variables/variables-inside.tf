variable "cpu" {
default = t2.micro
}

resource "aws_instance" "myweb12" {
  ami             = "ami-0fff1b9a61dec8a5f"
  instance_type   = "var.cpu"
  key_name        = "terraform-key"
  security_groups = ["new-securitygroup-for-terraform"]
  tags = {
    Name = "HR"
  }
}
