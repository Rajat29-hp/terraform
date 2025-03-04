resource "aws_ip" "my-eip" {
 instance = aws_instance.web.id
domain = "vpc"
}
