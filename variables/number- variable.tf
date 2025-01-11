# numeric type variable method

variable "instance_count" {
  description = "Creating 2 instance with Numeric Value type"
  type        = number
  default     = 2
}


resource "aws_instance" "myweb12" {
  ami             = "ami-02df5cb5ad97983ba"
  instance_type   = "t2.micro"
  key_name        = "my-key-new"
  security_groups = ["allow_tls"]
  count = var.instance_count

  tags = {
    Name = "HR"
  }
}
