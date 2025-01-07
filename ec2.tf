resource "aws_instance" "myweb12" {
  ami             = "ami-0fff1b9a61dec8a5f"
  instance_type   = "t2.micro"
  key_name        = "terraform-key"
  security_groups = ["new-securitygroup-for-terraform"]

  user_data = <<-EOF
  #!/bin/bash
  sudo yum update -y
  sudo yum install httpd -y
  sudo systemctl enable --now httpd.service
  sudo echo "<h1>This is web page for $(hostname -f). This web page deployed via Terraform</h1>" > /var/www/html/index.html
EOF

  tags = {
    Name = "HR"
  }
}

provider "aws" {
region = "eu-north-1"
access_key = "<access-key>"
secret_key = "<secret-key>"
}
