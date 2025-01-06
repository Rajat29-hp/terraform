resource "aws_key_pair" "terra" {
  key_name   = "terraform-key"
  public_key = file("/home/project/key.pub")
}
