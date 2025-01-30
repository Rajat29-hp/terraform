resource "aws_s3_bucket" "myexample" {
  bucket = "my-tf--bucket"

  tags = {
    Name        = "Mybucket"
    Environment = "Dev"
  }
}
