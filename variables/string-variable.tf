# String variable method

variable "cpu" {
  description = "cpu type define in this variable block"
  type        = string
  default     = "t3.micro"
}


resource "aws_instance" "myweb12" {
  ami             = "ami-02df5cb5ad97983ba"
  instance_type   = var.cpu
  key_name        = "my-key-new"
  security_groups = ["allow_tls"]

  tags = {
    Name = "HR"
  }
}
