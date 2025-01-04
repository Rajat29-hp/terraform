provider "aws"{
  region = "ap-south-1"
}

resource "aws_s3_bucket" "firstS3"{
  bucket = "My bucket "
  tags={
  name = "my_bucket"
  }
}
