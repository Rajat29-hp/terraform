# pass the local variable values from localvariable-values.tf file

 resource "aws_instance" "myweb12" {
     ami             = "ami-02df5cb5ad97983ba"
     instance_type   = "${local.cpu}"
     key_name        = "my-key-new"
    security_groups = ["allow_tls"]

    tags = {
      Name = "${local.tags}"
    }
  }

