# it is used to get useful impormation regarding deploy resource

resource "aws_eip" "lb" {
  domain = "vpc"
}

output  "lb" {
  value = aws_eip.lb.public_ip
}
