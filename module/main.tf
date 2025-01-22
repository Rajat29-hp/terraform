resource "aws_s3_bucket" "firstS3"{
  bucket = "My bucket "
  tags={
  name = "my_bucket"
  }
}
