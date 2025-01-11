# Conditional Expression Based on Use-Case


variable "environment" {
default = "Deops-Team"
}

 resource "aws_instance" "myweb12" {
     ami             = "ami-02df5cb5ad97983ba"
     instance_type   = var.environment == "Account-Team" ? "t3.micro" : "t3.small"
     key_name        = "my-key-new"
    security_groups = ["allow_tls"]

    tags = {
      Name = "HR"
    }
  }

