# list varaible Mehtod

variable "ami_images" {
  description = "Creating list of ami's "
  type        = list(any)
  default     = ["ami-094a9a574d190f541", "ami-0dc891a161c92cf39"]
}


resource "aws_instance" "myweb12" {
  ami             = var.ami_images[1]
  instance_type   = "t2.micro"
  key_name        = "my-key-new"
  security_groups = ["allow_tls"]


  tags = {
    Name = "HR"
  }
}
